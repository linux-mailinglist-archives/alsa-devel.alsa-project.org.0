Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C53C47DF72
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 08:17:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D82F16A2;
	Thu, 23 Dec 2021 08:16:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D82F16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640243861;
	bh=0+7xI3fjq8N0+4pFxhckK9Vss9x+h659RdiSazrM9Cw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QD1Qe3IO3bnu1vCLMJo9mpfnOGxEXxObywMqOobVKvfzjvQvJF2WpUb3ilhJqvxjZ
	 pkt5mmLo3g9/jQVPHki6tKV03gJIOMTizmGdMjzWd+7Vwrx/EZ4TR7zwIJDNNwQXtn
	 OEGxXEKPU9+ZXbHZi0h+YL/oxh6v1UJt7/v7dFFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F72DF80115;
	Thu, 23 Dec 2021 08:16:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 772BFF80105; Thu, 23 Dec 2021 08:16:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6C74F80084
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 08:16:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6C74F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="CFv9zbga"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8F2EEB81EA5;
 Thu, 23 Dec 2021 07:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D52C36AE9;
 Thu, 23 Dec 2021 07:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640243779;
 bh=0+7xI3fjq8N0+4pFxhckK9Vss9x+h659RdiSazrM9Cw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CFv9zbgao2K5GAKT7OFAHykZ5BaXh/U3cCM9kaTec23oWilYG3rk8qwvZ1gDX2RVK
 NxvucRUmM5nKlGE1eN69rssu7n69ZxFveS/3iQuF/vo3gGpH7Yd0jxrr3XKPEBKrdk
 DlX1mSeskjq5SYNGIky3xBn7ZgGfvc3CFtOhiq4E=
Date: Thu, 23 Dec 2021 08:16:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3 1/3] ALSA: hda/tegra: Fix Tegra194 HDA reset failure
Message-ID: <YcQiP+MxrlLi+R94@kroah.com>
References: <1640147751-4777-1-git-send-email-spujar@nvidia.com>
 <1640147751-4777-2-git-send-email-spujar@nvidia.com>
 <fb8cf33f-41fb-79c0-3134-524c290e4fc1@gmail.com>
 <f734e48f-dd60-ddb8-510a-3c4f37d8fb52@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f734e48f-dd60-ddb8-510a-3c4f37d8fb52@nvidia.com>
Cc: jonathanh@nvidia.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 thierry.reding@gmail.com, stable@vger.kernel.org, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, mkumard@nvidia.com
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

On Thu, Dec 23, 2021 at 10:04:19AM +0530, Sameer Pujar wrote:
> 
> 
> On 12/23/2021 12:10 AM, Dmitry Osipenko wrote:
> > 22.12.2021 07:35, Sameer Pujar пишет:
> > > HDA regression is recently reported on Tegra194 based platforms.
> > > This happens because "hda2codec_2x" reset does not really exist
> > > in Tegra194 and it causes probe failure. All the HDA based audio
> > > tests fail at the moment. This underlying issue is exposed by
> > > commit c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP
> > > response") which now checks return code of BPMP command response.
> > > Fix this issue by skipping unavailable reset on Tegra194.
> > > 
> > > Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> > > Cc: stable@vger.kernel.org
> > > Depends-on: 87f0e46e7559 ("ALSA: hda/tegra: Reset hardware")
> > Is "Depends-on" a valid tag? I can't find it in Documentation/.
> 
> I do find the usage of the tag in many commits though there is no reference
> of this in doc. I always thought it would act as a reference when commits
> get pulled to other branches. If this is not true and it does not mean
> anything, I will drop this.

It is not true at all, please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.
