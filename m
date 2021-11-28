Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B79FC461C12
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 17:46:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA3051F18;
	Mon, 29 Nov 2021 17:45:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA3051F18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638204397;
	bh=oCXIrS3lO3NYoj4fvZIhVtivc13BBzbI3p5WE6/4r9o=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kBGcxSu4DVB4F5Q1ltnEisUWwFxZwYv3tNKLyxZIzqJzIjRYiz/zaeLOUnS32zG2u
	 zh+PrBWmUFE8nGEMyAx1cT3F/HrHkYnqXn/q4Cg7SJI99ck4e8bjTbe30OekSi7bIf
	 bpdk0/aE4rRUGeS8K8o4XErBozms47r61xxCfbYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FB02F8025C;
	Mon, 29 Nov 2021 17:44:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25962F8028D; Sun, 28 Nov 2021 14:28:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from celforyon.fr (ns352767.ip-91-121-87.eu [91.121.87.121])
 by alsa1.perex.cz (Postfix) with ESMTP id E3EEBF800EE
 for <alsa-devel@alsa-project.org>; Sun, 28 Nov 2021 14:28:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3EEBF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=eldred.fr header.i=@eldred.fr
 header.b="kh0Mh9YS"
Received: from [192.168.1.65] (91-171-18-197.subs.proxad.net [91.171.18.197])
 by celforyon.fr (Postfix) with ESMTPSA id 2E6891204338
 for <alsa-devel@alsa-project.org>; Sun, 28 Nov 2021 14:28:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eldred.fr; s=mail;
 t=1638106100; bh=oCXIrS3lO3NYoj4fvZIhVtivc13BBzbI3p5WE6/4r9o=;
 h=Date:To:From:Subject:From;
 b=kh0Mh9YScW3H1Nrv687+1zpSqA1KD9RtcR8+SuyhqJmAJqf1hNuEpdsA+5QW+JIgv
 1YwdPwgCkXdfwi1cTmBm9D7d8rkExtLyD76DSAVqjL67gt0gKPO8hftjJrPy/yrcyK
 KVN55MEhx+m45G4QpqDQlhXA5NsnUWzQUZQUy6ZI=
Content-Type: multipart/mixed; boundary="------------430dJxiB0VO0DEYK30u01wA4"
Message-ID: <8b18294d-d082-2be4-18ba-39b4ec4b9e91@eldred.fr>
Date: Sun, 28 Nov 2021 14:28:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: alsa-devel@alsa-project.org
From: Eldred HABERT <stuff@eldred.fr>
Subject: Dual simulatenous output on single card not recognized
X-Mailman-Approved-At: Mon, 29 Nov 2021 17:44:54 +0100
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

This is a multi-part message in MIME format.
--------------430dJxiB0VO0DEYK30u01wA4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I bought a laptop with integrated sound output (either to speakers or 
headphones), and a HDMI output. Attached is the output of `aplay -l`.

Under both PipeWire and PulseAudio, I only get a single output/sink (by 
default to the built-in output), but I can get simultaneous output to both:
- under PulseAudio, by adding a `load-module module-alsa-sink 
device=hw:0,7` line to the config;
- under PipeWire, by adding a profile to the card to enable both 
outputs, which correctly provides two outputs that work fine concurrently.

I was directed to this mailing list after the following discussion:

 > It's a kernel ALSA bug if SOF actually must contain enough data for 
the driver to figure this out (or at least pass that data on to 
userspace to deal with it)
 > if [we are] right that hardware itself does not contain the required 
data, then it can only be fixed in userspace via a card database
 > which is one thing to do, another would be maybe a heuristic rule 
that attempts to guess if such cards with analog and digital sub-devices 
might be independent

Please tell me if more details are needed—it would be nice if hardware 
configurations like mine could be fully supported out of the box ^^

Cheers,
~ ISSOtm

--------------430dJxiB0VO0DEYK30u01wA4
Content-Type: text/plain; charset=UTF-8; name="aplay-l"
Content-Disposition: attachment; filename="aplay-l"
Content-Transfer-Encoding: base64

KioqKiBMaXN0IG9mIFBMQVlCQUNLIEhhcmR3YXJlIERldmljZXMgKioqKgpjYXJkIDA6IFBD
SCBbSERBIEludGVsIFBDSF0sIGRldmljZSAwOiBBTEM4OTIgQW5hbG9nIFtBTEM4OTIgQW5h
bG9nXQogIFN1YmRldmljZXM6IDAvMQogIFN1YmRldmljZSAjMDogc3ViZGV2aWNlICMwCmNh
cmQgMDogUENIIFtIREEgSW50ZWwgUENIXSwgZGV2aWNlIDE6IEFMQzg5MiBEaWdpdGFsIFtB
TEM4OTIgRGlnaXRhbF0KICBTdWJkZXZpY2VzOiAxLzEKICBTdWJkZXZpY2UgIzA6IHN1YmRl
dmljZSAjMApjYXJkIDA6IFBDSCBbSERBIEludGVsIFBDSF0sIGRldmljZSAzOiBIRE1JIDAg
W0hETUkgMF0KICBTdWJkZXZpY2VzOiAxLzEKICBTdWJkZXZpY2UgIzA6IHN1YmRldmljZSAj
MApjYXJkIDA6IFBDSCBbSERBIEludGVsIFBDSF0sIGRldmljZSA3OiBIRE1JIDEgW0hETUkg
MV0KICBTdWJkZXZpY2VzOiAxLzEKICBTdWJkZXZpY2UgIzA6IHN1YmRldmljZSAjMApjYXJk
IDA6IFBDSCBbSERBIEludGVsIFBDSF0sIGRldmljZSA4OiBIRE1JIDIgW0hETUkgMl0KICBT
dWJkZXZpY2VzOiAxLzEKICBTdWJkZXZpY2UgIzA6IHN1YmRldmljZSAjMApjYXJkIDA6IFBD
SCBbSERBIEludGVsIFBDSF0sIGRldmljZSA5OiBIRE1JIDMgW0hETUkgM10KICBTdWJkZXZp
Y2VzOiAxLzEKICBTdWJkZXZpY2UgIzA6IHN1YmRldmljZSAjMApjYXJkIDA6IFBDSCBbSERB
IEludGVsIFBDSF0sIGRldmljZSAxMDogSERNSSA0IFtIRE1JIDRdCiAgU3ViZGV2aWNlczog
MS8xCiAgU3ViZGV2aWNlICMwOiBzdWJkZXZpY2UgIzAK
--------------430dJxiB0VO0DEYK30u01wA4--

