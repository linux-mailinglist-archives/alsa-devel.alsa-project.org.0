Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E34C2511A9
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 07:44:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E255167C;
	Tue, 25 Aug 2020 07:43:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E255167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598334285;
	bh=77gyrFqLIR543EQMezuyQ+8NifBZXvzXN+ph1ylpYiE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mA699tVsA2NpNsy4XLQWd3RiRu6hmlcwb7gBw/nwio++YCj2MA3vP1Bhd6THDrFP9
	 Xy5/OP6Lv0YNEAMU9FUSMnJogJTHIcoTeo5YjMBK/Bd1KwjHL0472dZACBnTet5YXB
	 4/2kinShrdalCYIB/Mn4he3AjqAQ9s996uYh4WGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5B0EF80260;
	Tue, 25 Aug 2020 07:43:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 129DFF8025A; Tue, 25 Aug 2020 07:43:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DC2CF800EB
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 07:42:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DC2CF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="HteqUX9z"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f44a4690000>; Mon, 24 Aug 2020 22:40:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 24 Aug 2020 22:42:56 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 24 Aug 2020 22:42:56 -0700
Received: from [10.25.97.151] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Aug
 2020 05:42:53 +0000
Subject: Re: More Generic Audio Graph Sound Card idea
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
 <20200821121844.GF4870@sirena.org.uk>
 <878se4zybn.wl-kuninori.morimoto.gx@renesas.com>
 <58220f32-0b3e-d666-5bb0-bbeae27f6aab@nvidia.com>
 <87364by23u.wl-kuninori.morimoto.gx@renesas.com>
 <e6e04e2c-2695-b7ba-3eb2-79158f317e4a@nvidia.com>
 <87r1rvwbsd.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <2d9140c7-7cba-34d9-d4b7-c9f9f395d9e7@nvidia.com>
Date: Tue, 25 Aug 2020 11:12:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87r1rvwbsd.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1598334057; bh=HZQ3trerCuf4EVoLWUUg57xxn7aGKS8NeuWVY/9oZ0k=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=HteqUX9zkdNQ150kqbvQVsNyyrAqfVvGro+sCALnA3Tb1vlP2BL5Z1NEuNqYtnjTm
 YObQZRI4enRvlV2g+fTZbzY4UJPZ36GSsQYGTttRcLwfU3vLURp64qmFZgedxcctFr
 sDICq2tjBUG5LRiD0GNT21Cz3H66gDDHl9cxpv0FYyG55XCj7gHSBukdgIQ6zg05UN
 w3rro86omLjbbUlTGllfy8KVQUBuFRhu32XjJN9yaHPQRSaMCE1Vv62JFN374DHGxf
 Ol5UHV+bUorNm+funbCaalju3V41VjzVLHDcwYjPSqIyJ6gpBgL+psVFwIiMCWubpj
 6Ufc1VBag2oqg==
Cc: sharadg@nvidia.com, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 jonathanh@nvidia.com
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

Hi Morimoto-san,

>>> But, I guess new driver 1st version is focus to
>>> detecting normal-link and DPCM-link only.
>> Do you plan to propose something like enum for card2 and has scope for
>> extension, where link type can be normal/DPCM/codec-to-codec/etc., ?
>> Since there are so many board variants and may have some specific
>> requirements, I am wondering being able to detect link type from DT
>> should be the only motivation for a new driver.
> I'm now thinking that new one can detect normal-link, DPCM-link,
> multi-CPU / multi-Codec, Codec-to-Codec as normal audio-graph feature.
> And has .hook callback for Eeach board specific feature.
> see my previous mail which was To:Pierre-Louis
> But, it is still under idea, not yet fixed.

If we plan to go this way, I think we need to consider board specific 
configuration at init time and one at runtime. In that case there could 
be multiple compatibles that would get added to the driver and various 
other requirements can be managed with behavioral flags instead from DT?


Thanks,
Sameer.
