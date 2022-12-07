Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90980645469
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 08:14:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 112C2186B;
	Wed,  7 Dec 2022 08:13:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 112C2186B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670397253;
	bh=SnJZwq6XZGUWZpNuhmRFN9PiqDjOfH6NdVQmGbm/GY0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fc2Q0EzjfQ+cdTK4r5PBftyJUjjJ5y7WN+yNohWxBAEjDC1bbYrcIICxSWg9WRaNK
	 02FOlEulwLY7LvYYYxtmqBbngwHAsm7SC/K7uyogn12n3U4Z7haDybqg/J4tPSf2QI
	 F4DIdK9IptiM/EIihxrnQ1qy3UyZRmL8XZhOZNPM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3C3BF80424;
	Wed,  7 Dec 2022 08:13:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEA0BF8021D; Wed,  7 Dec 2022 08:13:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 743E4F800EE
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 08:13:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 743E4F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="cc4WU7G0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C864C601D7;
 Wed,  7 Dec 2022 07:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E3AC433C1;
 Wed,  7 Dec 2022 07:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1670397184;
 bh=SnJZwq6XZGUWZpNuhmRFN9PiqDjOfH6NdVQmGbm/GY0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cc4WU7G0EPGsDWR3dst6hcxPjyPoqgAWsnMbOGBVceuz8I5RcvSs9QjUsN+3TmNjf
 Qg6o2hkNSw2ifvUd3UknLJIYJdeV/hmjWumJkE7JjdCnYt9OrKN7PBjJme7tg9et5e
 j82uLTs6nww9LE580XZTb/ugHgCeZDjNnvy3knl0=
Date: Wed, 7 Dec 2022 08:13:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dicheng Wang <wangdicheng123@hotmail.com>
Subject: Re: [PATCH v3 -next] ALSA:usb-audio:add the information of KT0206
 device driven by USB audio
Message-ID: <Y5A8/bpWoG4Dp2Nx@kroah.com>
References: <Y480pd/XynYddrHk@kroah.com>
 <SG2PR02MB58789FBF9A2EA801AF49D5E88A1A9@SG2PR02MB5878.apcprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SG2PR02MB58789FBF9A2EA801AF49D5E88A1A9@SG2PR02MB5878.apcprd02.prod.outlook.com>
Cc: alsa-devel@alsa-project.org, john-linux@pelago.org.uk,
 connerknoxpublic@gmail.com, sdoregor@sdore.me, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, tiwai@suse.com, hahnjo@hahnjo.de,
 wangdicheng@kylinos.cn
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Dec 07, 2022 at 11:20:23AM +0800, Dicheng Wang wrote:
> From: wangdicheng <wangdicheng@kylinos.cn>

This name and email address does not match the name on the From: line.
Please work with your company to allow you to send out kernel patches
properly, spoofing through a hotmail.com address is not something that
your company wants to have happen, as anyone can impersonate an address
from them (and this one doesn't even pass basic email verification
checks) :(

thanks,

greg k-h
