Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 900E1251192
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 07:33:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25E1E1688;
	Tue, 25 Aug 2020 07:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25E1E1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598333598;
	bh=BJgbKeXdgr54DuT8yzrbCAfJsLcJAibFpHpcGbx67pg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TN5gDp0jmz2Uo7MriHksECgj6+Q3ctkj9d9CM3TZquPb0+F/awW7tVJVrce2owKFc
	 LW8RPurPjkWsyTkOoXDbTI8J/W+ShR5QzWgAZ0cfA5QjIoDY4sTT+IrsVLEEAqd0iv
	 96fI4R1Mnr3Ay3SpjIW/dyVZFpOKQXDQzF5VXVkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 523C4F80245;
	Tue, 25 Aug 2020 07:31:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BC44F8025A; Tue, 25 Aug 2020 07:31:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 443EAF800EB
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 07:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 443EAF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="fmYwSvJG"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f44a1eb0001>; Mon, 24 Aug 2020 22:30:19 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 24 Aug 2020 22:31:21 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 24 Aug 2020 22:31:21 -0700
Received: from [10.25.97.151] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Aug
 2020 05:31:18 +0000
Subject: Re: [PATCH 0/2] Tegra HDA specific fixes
To: Mohan Kumar <mkumard@nvidia.com>, <tiwai@suse.com>, <aplattner@nvidia.com>
References: <20200825052415.20626-1-mkumard@nvidia.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <93744a6d-843a-0e8c-d0d1-d0d7e9a8458c@nvidia.com>
Date: Tue, 25 Aug 2020 11:01:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200825052415.20626-1-mkumard@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1598333419; bh=1BROby4DFgEOnZO+X7W4iJVTRoHH6abe5JWVienKd/w=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=fmYwSvJGjPtEYF5C3cCrKfID+I/9d6nlOuFBHBU4SGlzw3RAeVcoc/8Yf6tSzFsjp
 4cwWyNg2VCLLPZ0Uu2BVVopbhqtO4A0VGhOm2FpnmCttNheK6KjPG6YoNCovDqtben
 olBwkgG13hOlBDV+XYWV2RSNtRteCqCSmkTyrpku+5dYN/frb4sQa0xxMKj0XmCpGJ
 AvG0XnrUxhIJxpREtl+9BW33TJg8aCFNjq04iFdCryB4V20kZU+I6uGVnR7NG5wB9o
 gVAURQ2+UOcKDBNCv0lewUQzpGxG/lemdbCkDhuVlepjqXK0hYhOBHlALg/BZ0xMWw
 DoY14Rbatkhrw==
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 treding@nvidia.com, jonathanh@nvidia.com
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


> This series has the fix for
> - 2 Channel swapping issue for Tegra
> - WAKEEN programming to detect wake events.
>
> Mohan Kumar (2):
>    ALSA: hda: Fix 2 channel swapping for Tegra
>    ALSA: hda/tegra: Program WAKEEN register for Tegra
>
>   sound/pci/hda/hda_tegra.c  | 7 +++++++
>   sound/pci/hda/patch_hdmi.c | 5 +++++
>   2 files changed, 12 insertions(+)
>
Acked-by: Sameer Pujar <spujar@nvidia.com>

