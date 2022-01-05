Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBAF4851FE
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 12:45:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C85318B4;
	Wed,  5 Jan 2022 12:44:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C85318B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641383142;
	bh=jMfT9xPIsqEfxt0aSl5f1zq4xF1hcR4BpRNAog5nMW4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LaNQqijp9OhINxpokbF914Xzh+CZsybm5ykRKauIiSL5D+qLnFZESxslogoUecROy
	 ZoKnF/Dey7UO4azaSALga5nu0dKxuXihCGi+GQ1Q5yrLkKFmsYLsY/MNF8ewDG834l
	 l6W5EqGMjTLKHhKETJHeXXFEYsMZo11cMkN/il34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81C63F80089;
	Wed,  5 Jan 2022 12:44:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B06D0F801D8; Wed,  5 Jan 2022 12:44:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEBC9F800BB
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 12:44:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEBC9F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="jq8/KP/p"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0A403B81A9C;
 Wed,  5 Jan 2022 11:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210AEC36AEB;
 Wed,  5 Jan 2022 11:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1641383063;
 bh=jMfT9xPIsqEfxt0aSl5f1zq4xF1hcR4BpRNAog5nMW4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jq8/KP/p2TuxJ+h96v8nf2Iy2zKsb/RmESIKkjqMYzBO9W+sy0CbQotgMRBHu6oFv
 +qBOjFWxhF/7yCmduYEyFvFaF6hoRp4X22U8KPbCpR7+1zDggUESvJSMj5vl3Wy8mQ
 Lqe9/lYRpsSSym8eGXoIumcaxyBBLt1f5SFHK7gw=
Date: Wed, 5 Jan 2022 12:44:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Baole Fang <fbl718@163.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Legion Y9000X 2020
Message-ID: <YdWElRjkZ0lybrMJ@kroah.com>
References: <20220105034103.12484-1-fbl718@163.com>
 <s5ha6gak2qf.wl-tiwai@suse.de> <YdV5MNWOwgrtH2UC@kroah.com>
 <757a4402-1067-e3c8-8ca3-43ee62047ebe@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <757a4402-1067-e3c8-8ca3-43ee62047ebe@163.com>
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, Takashi Iwai <tiwai@suse.de>,
 linux-kernel@vger.kernel.org, Elia Devito <eliadevito@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Werner Sembach <wse@tuxedocomputers.com>,
 Hui Wang <hui.wang@canonical.com>, Sami Loone <sami@loone.fi>,
 Cameron Berkenpas <cam@neo-zeon.de>
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

On Wed, Jan 05, 2022 at 07:39:33PM +0800, Baole Fang wrote:
> Sorry, this is my first time to submit patch to Linux, so I'm not quite
> familiar with the convention. Since I was changing based on v5.15.12 and I
> saw others mentioning their upstream commit, I included the that commit id.

Those commits were coming from the stable backports only, they were not
done by the original author.

> Please forgive me and tell me what is supposed to be done if possible. I
> still have a lot to learn.

Please take a look at the "first kernel patch" tutorial on the
kernelnewbies.org site for a good example of how to do all of this.

Also the Documentation/SubmittingPatches file in the kernel source tree
should help out.

thanks,

greg k-h
