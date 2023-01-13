Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFC6669CAA
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 16:44:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98C79ABE2;
	Fri, 13 Jan 2023 16:44:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98C79ABE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673624698;
	bh=RDtldCHhOU3Bo3pJibaZpOM4uT1+p0yui2PnCg+as8o=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=L/x4xD/6CqELhfUaLSXcsQSMVua5sBRCgGbs1A9urzKrF3dRYK0QLxNo9AM9vSmxh
	 vtiEFrvvuDr+elwtXzcCJmp9QFmDwJJD7cObqzZM6H+ojLr24nfKpPLEO6ZqxcdFT9
	 +w3hfexiNwNwT/Q13ji1F7K+4S1afLPxA741uIYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51087F803DC;
	Fri, 13 Jan 2023 16:44:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F24BF8030F; Fri, 13 Jan 2023 16:43:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7543F8019B
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 16:43:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7543F8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ONzkQ7gZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D0E10B82121;
 Fri, 13 Jan 2023 15:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5D1C433F1;
 Fri, 13 Jan 2023 15:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1673624633;
 bh=RDtldCHhOU3Bo3pJibaZpOM4uT1+p0yui2PnCg+as8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ONzkQ7gZ51JUMsLapq5pmDiXaYOsJLLKodE1n30W6DeD/hxkiGhdhnuDXGP90YlbB
 JSI9yUyvBZb3c/HDy6J4IQU80Ff8wPYSMi+gmsG4rZWTUwkdOG3YqVNsK35QKS5SvD
 /pVuMIR7QPeHSFYlgmpFIzfAUvBV3uYCbkPFXmZw=
Date: Fri, 13 Jan 2023 16:43:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 5.10.y] ALSA: pcm: Properly take rwsem lock in
 ctl_elem_read_user/ctl_elem_write_user to prevent UAF
Message-ID: <Y8F8F9MpNR4O8kbB@kroah.com>
References: <20230113142639.4420-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113142639.4420-1-tiwai@suse.de>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Clement Lecigne <clecigne@google.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jan 13, 2023 at 03:26:39PM +0100, Takashi Iwai wrote:
> From: Clement Lecigne <clecigne@google.com>
> 
> [ Note: this is a fix that works around the bug equivalently as the
>   two upstream commits:
>    1fa4445f9adf ("ALSA: control - introduce snd_ctl_notify_one() helper")
>    56b88b50565c ("ALSA: pcm: Move rwsem lock inside snd_ctl_elem_read to prevent UAF")
>   but in a simpler way to fit with older stable trees -- tiwai ]

Thanks for the backport, now queued up.

greg k-h
