Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D02941C34DE
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 10:50:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D35716F8;
	Mon,  4 May 2020 10:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D35716F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588582249;
	bh=xiDrW6haIdvy6rCVGujT/G3u13Xs2ovPuZDWJxjsDA0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TYdsat895DJ5OSuxmgs7iZtcx30vLKPSWJEuynGdnJ2LNoDEjcgp1qij+2IDyMDTa
	 OsUlftAW5XOVgrtAqPIpVKRk0I5NKS9YS3I/kq4Z+fVCAmyF4i0zE3ljEjJC2TEKsf
	 BP3c5lP2ZvgoSefvQtVwwKkFvptcAbNTtmZLEUQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77D90F80258;
	Mon,  4 May 2020 10:49:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A5FFF80249; Mon,  4 May 2020 10:49:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C422F800E5
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 10:49:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C422F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="XSW34aqj"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eafd67e0000>; Mon, 04 May 2020 01:46:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 04 May 2020 01:49:02 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 04 May 2020 01:49:02 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 May
 2020 08:49:01 +0000
Received: from [10.25.97.23] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 May 2020
 08:48:51 +0000
Subject: Re: [PATCH 0/3] Tegra194 HW Fixes
To: Takashi Iwai <tiwai@suse.de>
References: <1588580176-2801-1-git-send-email-spujar@nvidia.com>
 <s5ho8r4f6hx.wl-tiwai@suse.de>
 <124d4a5c-e198-d8c0-5fb7-65d008852e32@nvidia.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <2828495a-d27a-a69b-37f5-fd3fb714188b@nvidia.com>
Date: Mon, 4 May 2020 14:18:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <124d4a5c-e198-d8c0-5fb7-65d008852e32@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1588582014; bh=xiDrW6haIdvy6rCVGujT/G3u13Xs2ovPuZDWJxjsDA0=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=XSW34aqjeSFsT0o3jXEMorJsHtWtjtOhegjVVBJaXr7olh/Kt9O77q0+2ik/wQRDB
 VIAQSBHXUnYk/Brz2/dqszVESGy83flQiiwu/7O1jteP2J/FUKt3+HKhX0Pb2DomIV
 559UZehTseejIZzpKZwYzg6vVPExXLPFwrbS6kOxy0NAL/oo5nyPsOShmSxQfkgzvc
 Shu4JE8lJD6eGqEf397vAgXOmK1CJ2Z+BwmZigfP3wKBEki9zvbQecdU9QWXZrsejd
 b/owOgzIX6n9IWpIkeZMaLikAQ0YuyTd5fNbtkeQPSIn2DXFzY9MXYEBkOzhkbSafr
 SPLLYPUTI24Cg==
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 spujar@nvidia.com, tiwai@suse.com, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, atalambedu@nvidia.com,
 linux-tegra@vger.kernel.org, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
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



On 5/4/2020 2:05 PM, Sameer Pujar wrote:
>
>
> On 5/4/2020 1:59 PM, Takashi Iwai wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On Mon, 04 May 2020 10:16:13 +0200,
>> Sameer Pujar wrote:
>>> This series proposes SW workarounds for Tegra194 HDA HW bugs.
>>> Following are the two issues seen:
>>> =C2=A0 1. GCAP register does not reflect true capability.
>>> =C2=A0=C2=A0=C2=A0=C2=A0 The actual number of SDO lines is "4", where a=
s it reflects "2".
>>> =C2=A0 2. With 4 SDO line configuration playback fails for,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 44.1K/48K, 2-channel, 16-bps audio stream.
>>>
>>> After fixing [1], issue [2] is uncovered.
>>> As per recommendation by Tegra HW team the workarounds are pushed.
>>>
>>> Testing done
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0 * Verify GCAP register after registering HDA sound card
>>> =C2=A0 * Verify audio playback for 44.1K/48K, 2-channel, 16-bps.
>>>
>>> Sameer Pujar (3):
>>> =C2=A0=C2=A0 ALSA: hda/tegra: correct number of SDO lines for Tegra194
>>> =C2=A0=C2=A0 ALSA: hda: add member to store ratio for stripe control
>>> =C2=A0=C2=A0 ALSA: hda/tegra: workaround playback failure on Tegra194
>> Through a quick glance, all changes look good.
>>
>> Is the device already in market, i.e. it had hit users?=C2=A0 If yes, I'=
m
>> going to merge for 5.7, otherwise for 5.8.
>
> Yes the device is in the market. But has not been reported by end users.
> During internal resting this has been discovered. I am fine with=20
> merging this to 5.8.

To add, end users currently won't see this problem because things work=20
fine with 2-SDO lines. The issue is seen when Tegra194 is allowed to=20
utilize its actual capability of 4-SDO lines.
>
> Thanks,
> Sameer.
>>
>>
>> thanks,
>>
>> Takashi
>

