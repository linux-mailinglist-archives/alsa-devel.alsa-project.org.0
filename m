Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE39269C9C0
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Feb 2023 12:24:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28935E9E;
	Mon, 20 Feb 2023 12:23:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28935E9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676892278;
	bh=g8EHqcl4piI0dKSU8Sgvd8urd/g6i4GCgx++D5N2NRo=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sY1dGOf8ykQ/kSFr0DckuKXw66OLYoCTf47LDV18EcIA1GYxbmMOHmsgOp70tdOjF
	 4ey7FqhpiBzl0on4Df844HCOrPp8eiS8CqS6TTulJBKsRgD0t8XHEhdWQ+jOzz5B2T
	 axjatzSSetImgoMdHaOJctwllJwUaFGRGcQWvj/w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56B83F8025A;
	Mon, 20 Feb 2023 12:23:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5683FF80266; Mon, 20 Feb 2023 12:23:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3CE4F800BA
	for <alsa-devel@alsa-project.org>; Mon, 20 Feb 2023 12:23:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3CE4F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=lt6huX+a
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BBE4060CF9;
	Mon, 20 Feb 2023 11:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3DFC4339E;
	Mon, 20 Feb 2023 11:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1676892219;
	bh=g8EHqcl4piI0dKSU8Sgvd8urd/g6i4GCgx++D5N2NRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lt6huX+a30GL1wXK/zBj3efXdLlL7grE8geC8f8YOEmJpFSaNvSbt0+RM7Hyu2RDn
	 emKUR/GmVESBpYiRDfsceYI7Sd+bLgLoVlFDE4jMzWz2KqbZuCtlmsDL8T0eSoUuXQ
	 FijYzgpb6P0+DJbwgqjRob/ypEX+jM0wbfVBbaW8=
Date: Mon, 20 Feb 2023 12:23:36 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH BACKPORT 5.4] ASoC: SOF: Intel: hda-dai: fix possible
 stream_tag leak
Message-ID: <Y/NYOAkc+EuQsQgD@kroah.com>
References: <20230220111721.32502-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220111721.32502-1-peter.ujfalusi@linux.intel.com>
Message-ID-Hash: 6SEB4WVZHR3DJI4ZAFSWARFVVYIDEF2I
X-Message-ID-Hash: 6SEB4WVZHR3DJI4ZAFSWARFVVYIDEF2I
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: stable@vger.kernel.org, sashal@kernel.org, broonie@kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SEB4WVZHR3DJI4ZAFSWARFVVYIDEF2I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Feb 20, 2023 at 01:17:21PM +0200, Peter Ujfalusi wrote:
> [ Upstream commit 1f810d2b6b2fbdc5279644d8b2c140b1f7c9d43d ]
> 
> There were just too many code changes since 5.4 stable to prevent clean
> picking the fix from mainline.

Thanks, all backports now queued up.

greg k-h
