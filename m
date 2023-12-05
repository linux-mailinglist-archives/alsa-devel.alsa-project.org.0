Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4202980515F
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 11:57:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18F3E828;
	Tue,  5 Dec 2023 11:57:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18F3E828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701773844;
	bh=8tkCWpcqt4yLVJQfNcX5LLCmOI7JBzQb7/cy4uywj0I=;
	h=Date:Subject:To:References:From:CC:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ENFu5DLBWfAPwflBN2D0uTMALV5LTCWV6JdlW7WqSnEUhi1iT0xu32wPonWc0hmBr
	 SEs0FNQ/zFd64GjYfRng68XeQ8ldetxcp8g6CimQg4dNH5ZNQRqo86xP0xgWY2GQje
	 fidyQA8YdOBwhAvJaK9gVBnr2tiRQpa0YY+N896U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38C8EF80568; Tue,  5 Dec 2023 11:56:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BD8AF80564;
	Tue,  5 Dec 2023 11:56:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D76EF8024E; Tue,  5 Dec 2023 11:56:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B281F800E4
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 11:56:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B281F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=IzPQ9fnQ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B5AskUI031438;
	Tue, 5 Dec 2023 04:56:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:references:from:cc
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=ikPjx6XOoYC3Jy0teh1E+FnJ1f4ILiGPhjfLJdxHwRQ=; b=
	IzPQ9fnQyOr0mzJ4d0GUH5knGqq12BTwn79ZkQfI4CoY9g7KbnzuZzNODw5mClAR
	0nTekllfWFcmZ/IPvaQS30btn09WHdio6Hjy4v3rtlsvO7BQ3beXfRICDqbr81Hl
	FyAIU4mS8I/sGy8EdFmxpZYu76iD5JU/9+VQ8Uauth8ae1BZw/Teho+NrEjSRyw3
	W2h+lRDy7CcPYDWeKv0C0wxA1oSHVDOrozzqtJ2hSIdscxhMOcPzhaZS9zk2/0eS
	Tnbbt2FDwhxolpT57FsrFdeaPKYEY8O2v5cHsvrQ5Zqs1ByJZhA0mPaG4u4cKqvU
	IH4Gy9WdL34SB086L7aHSA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ur2v232nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 04:56:35 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Dec
 2023 10:56:33 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Tue, 5 Dec 2023 10:56:33 +0000
Received: from [198.61.65.139] (unknown [198.61.65.139])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E32A0474;
	Tue,  5 Dec 2023 10:56:32 +0000 (UTC)
Message-ID: <562c53e9-2fd0-4b55-9035-45ace43a6b29@opensource.cirrus.com>
Date: Tue, 5 Dec 2023 10:56:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG hda/cs8904: Headphones not detected and no speaker sound
 after system suspend
To: =?UTF-8?Q?Andr=C3=A9s_Pedraza?= <adpg.611@gmail.com>
References: 
 <CA+kJtouKztDJa38ikCY41SpLtZLHqyrg8UfMpK+GZn00=MfTFQ@mail.gmail.com>
Content-Language: en-US
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Organization: Cirrus Logic
CC: <alsa-devel@alsa-project.org>
In-Reply-To: 
 <CA+kJtouKztDJa38ikCY41SpLtZLHqyrg8UfMpK+GZn00=MfTFQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: b0nJZQ6FzaPYshpxs2AAk001XHPYAZAY
X-Proofpoint-GUID: b0nJZQ6FzaPYshpxs2AAk001XHPYAZAY
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: JHYEXWQHBIS64FIHOEVVC3Q6KAUUDNVP
X-Message-ID-Hash: JHYEXWQHBIS64FIHOEVVC3Q6KAUUDNVP
X-MailFrom: prvs=770370f61d=vitalyr@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHYEXWQHBIS64FIHOEVVC3Q6KAUUDNVP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andrés,

We need a bit more information and help from you. Could you , please, 
send us full dmesg log  (not just a fragment) .

It looks like the problem in suspend() function in the driver connected 
to this particular

model of laptop. Short story is that we have tested this on Vostro 3401, 
Vostro-3520 and Inspiron-5415

and found no issue with suspend/resume functionality, but all these 
laptops are Intel's CPU,

and yours is AMD AMD PIC/DALI CPU model, and it looks like this issue is 
related to the specific

HW setup, in other words how system executes suspend sequence. By 
looking at the description

it looks like the codec driver incorrectly executes suspend sequence and 
cannot be waked up on resume because of this.

So, full dmesg log will be helpful.

Thanks,

Vitaly


On 27/11/2023 21:12, Andrés Pedraza wrote:
> Hello my dudes.
>
> I've been having this bug for a few months now. Sound on my laptop works just
> fine until the system suspends or I close the lid. If my headphones are
> connected when I suspend the system, then there's no sound on headphones or
> speakers on wake and PulseAudio claims there's never any headphones connected.
> If my headphones aren't connected on suspend, then speakers work just fine, but
> headphones are still never detected and make no sound.
>
> Additionally, I recently found out that after waking from suspend, if I run
> `sudo dmesg | grep snd` I find two timeout warnings that weren't there before,
> and more showing up as I keep running the command. They go:
>> snd_hda_codec_cs8409 hdaudioC1D0: Timeout waiting for PDN_DONE for
>> CS42L42
> I'm on a Dell Vostro 3405 laptop, which I know has a Cirrus sound card. I
> recently compiled and tested this bug on the Linux 6.6.2 stable kernel. No dice.
> I attach the outputs of `pactl list sinks`, `sudo dmesg | grep snd` and `sudo
> lspci -v | grep snd -B 10`. Please do tell if the issue might be caused by some
> other module or BIOS configuration, or if you need more data.
