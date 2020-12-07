Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 804F52D0C22
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 09:54:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8FF1172F;
	Mon,  7 Dec 2020 09:53:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8FF1172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607331267;
	bh=OmU6VIuzrfU2tkcpfBpGag+wEALuW75gf2pstoytFCY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NMe0yqC2Bc01Bn4XpR3WgND2tmGK+Wmy/CLh2Au1lyBcTycq7I9ORKYU4cLUkClSb
	 Wbifd52Lwc1X31gZ5XUY6yIMf/FJm7bEE1wCp1LnE2lM8AdosYZ6oJXAnq4tCRadq7
	 eUu3Yck8OUqMhAXYqzN+lTlf2Q3UQLbp2TuMl2zY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F072BF80217;
	Mon,  7 Dec 2020 09:52:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7592CF8020D; Mon,  7 Dec 2020 09:52:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EF40F8015B
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 09:52:41 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2E62CA0047;
 Mon,  7 Dec 2020 09:52:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2E62CA0047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1607331161; bh=PG1fJx+9nYMGJsne8g+wOhZ3EpTRJTCCuJ/OZLzqXQs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lD7d0Pmx610WGSyHFCCtah+oXu53W4fysbi6jO81S0YCwx0YZe1vkDE/Ic31b7Wud
 dMGxS2rUhbR+C+61j7wkgSogBFDjT6YJ62K5tuC98/tIzOSNszbdIGTBrouRWBPyXZ
 O1Jv9Bb9Hp95IFGJ23b7aS1Uu47nzrWP51PpgSb8=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  7 Dec 2020 09:52:37 +0100 (CET)
Subject: Re: snd-rn-pci-acp3x - auto dmic detection unreliable
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
References: <a13f4f45-513e-0b99-8cf4-0ae89bf7d6bd@perex.cz>
 <MWHPR12MB166388C29409E3D488E5C85597E10@MWHPR12MB1663.namprd12.prod.outlook.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <a7f011e4-0fb8-b861-ebc8-be6de0d46d50@perex.cz>
Date: Mon, 7 Dec 2020 09:52:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <MWHPR12MB166388C29409E3D488E5C85597E10@MWHPR12MB1663.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>, "Kandimalla,
 NagaMalleswaraRao" <NagaMalleswaraRao.Kandimalla@amd.com>, "Arya,
 Virendra-Pratap" <Virendra-Pratap.Arya@amd.com>
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

Dne 18. 11. 20 v 10:25 Mukunda, Vijendar napsal(a):
> [AMD Public Use]

AMD: You just replicated my original question without any answer (2 weeks+).
Do you have something to share or do you not support your code?

				Jaroslav

> -----Original Message-----
> From: Jaroslav Kysela <perex@perex.cz> 
> Sent: Wednesday, November 18, 2020 2:37 PM
> To: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> Cc: ALSA development <alsa-devel@alsa-project.org>
> Subject: snd-rn-pci-acp3x - auto dmic detection unreliable
> 
> Hi,
> 
> 	it seems that the ACPI auto-detection of the presence the digital microphone connected to AMD Renoir audio bridge is unreliable. It may be that hardware vendors do not provide the correct ACPI tables.
> 	Could you clarify the usage of _WOV integer value? It seems that this value is set on those plaforms which do not have the digital microphone (the microphone is connected to the HDA codec):
> 
> _WOV integer value should be set only when DMIC is connected to APU.
> When DMIC is not available, _WOV integer value should be set to zero by BIOS.
> 
> Lenovo IdeaPad 5 (15ARE05)
> Lenovo Thinkpad X395
> 
> 	In any case, we should probably improve the auto-detection using DMI or other platform info.
> 
> 					Jaroslav
> 
> BugLink: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D1892115&amp;data=04%7C01%7CVijendar.Mukunda%40amd.com%7C4d901531b6454bebc58208d88ba15a4b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637412872412887848%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=S7769uYGT3db%2BaztzZyobmVN2leseXPqjR6pktFUaR0%3D&amp;reserved=0
> 
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
