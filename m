Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EEE2DFBA7
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Dec 2020 12:52:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5373175F;
	Mon, 21 Dec 2020 12:51:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5373175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608551524;
	bh=rd6VEctWB4nDI2NAAoT4BHi2JKFR7QWG2LB+OufW0tM=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WZmfXcBvub+vjOIG221UExID70zEWJQ4LOCvUAkMlY9aGXkZzb1ZI0kySWSVhTRHa
	 yxX4dDtUNZL2O9qK/pxkehjefKlfPfXSrytFJQ4ostbTNlXIYFX3akEJ6i1Cm4nuTr
	 HCWLGnUxIFctAzniIti6INYSsyb4ZTCg62gNd4Zs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7050EF801EB;
	Mon, 21 Dec 2020 12:50:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73355F801D5; Mon, 21 Dec 2020 12:50:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A793F800E4
 for <alsa-devel@alsa-project.org>; Mon, 21 Dec 2020 12:50:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A793F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="VS6sqGVD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1608551414;
 bh=rd6VEctWB4nDI2NAAoT4BHi2JKFR7QWG2LB+OufW0tM=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=VS6sqGVDQZZGdpWqI77a+J+EnrceIu0vJfp3F2EggTZuIjC5fUf7a9NiWRWyDhK1K
 SrGitA0E9MwNHrkSeV+FePIykjbmsU7NguPdiW5MtTJbrNgMEihlj+xed/bfCv3DOV
 g8xposqV+C7KU06FleTGAXrm1C9fHMpSC1D0g5ko=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.53] ([46.93.200.83]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFbW0-1ksdkv1xks-00H45K for
 <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 14:50:47 +0100
To: alsa-devel@alsa-project.org
From: Michael Kirchner <mkirchn@gmx.de>
Subject: wallclock time for midi events without audio port
Message-ID: <7b9f2025-2203-1674-90f5-1bc933a5fe8a@gmx.de>
Date: Thu, 17 Dec 2020 14:50:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: de-DE
X-Provags-ID: V03:K1:IShKoonngqSaZeSlg/EDQ2Xa6RaV37RWAqifWv7cHg1qSQDPg4R
 9lj+qcVkcCI+ETZuK8Sl13oHvCYpwUjhV57tzVHdrF+wUtiFCdihD5iXXMuu454NAZk430r
 eKsXYLqcIry6NZWecKkiea6pFifPEOSk58tx7fkZgmR/rTBpYsKvzZBCyU17prtH+O2JfNd
 8ir8c9IZOJGzlyuSX245A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CAasCr6ivNU=:oRCb0G3tZaULi5EsVZ0/V0
 CU4adqxiWaqJ3B6sGnleHNhjo3gop8QZQ1Fp2V4rZmCBNZWdKZQtLUORapjC4vRfJmeu5RifY
 ukdZBNVKTgfattcF59qn9Wew5rUISEGpA+1yyFXVx045b9x2fZ+iWaV/wvcbZ34Lw68FOmCXf
 faX0TIuN0KTaNnPzIXvH4jRLwd8G+bDzhOU7NJDlacCotEkWLxjMEEPsKq2rg3Xt+C4ilFCOP
 IbN3NmttnQYdpP7IEi+hq6FrH3FiWUeZ12qEaJJHpnyEk12yIoxfvL9U5HVIYEd9WLLxua1TU
 tl2FXk/J9arkVQqaqE6hVadj8ltPRhHniJS0DJAKdwCL66cQKY5KtmMsXM9E+qaA2hjJZYjBc
 caJMiWf9sdf4/wGk6HN93NxKJEHC6A0wEEW7UWCiu+1TGNn7Tt4Qzdd+UbzkJcWzMk2j5Pcbf
 pbh6bIUaSvPIRvStOZxDt9q4iQAkS1zvRmVF9MAqA/eF+Dnx/nV+i07VqDxMUiJ9aJJRSrDn3
 KNzkOhapcszPOnxCokvD//RjXA4E+1dly41wG8A0gt2tmUlQEUn1z+3GPLPRzRQtuvi207VC6
 q1Q3TQVW+QAoDXunDYIaQG8UOrVJWcDdOyu4bP6H8gHDhVbvwkThaDe5VeEa6bADmJfgnFLFd
 AeuzkoX9XXIGEqQm4r+JJx+gayGSHIikKQD8Ld6HsD7WtjOW4IQH9xLUV9jCccfynwrLuGUbH
 f27295dhmszjHl0Y7wJupA1LiSSjQMQre/7xmX0L1I0CcGOs+B2rf5K3zhMdwIXIzA3hOsKpm
 gXOpYp6u3fZbWWlQyMiu14yIr8jptOUperL5lKH0kRwJmVcbKhcVodcjmB8ksZPlbpvhuO1a+
 YX+zItwFJsSI+9YnGzQQ==
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

Hi,

i try to get an absolute wallclock time for midi events using
event->time.time.tv_sec.

As I understand I have to add trigger time to get wall clock time.
Therefor I use snd_pcm_status_get_trigger_htstamp().

If I use alsa audio via snd_pcm_open there is no problem.

But: how can I get trigger time if I use only a midi port without audio?

(usecase is: soft synth with alsa midi in -> jack audio out)


Sincerely,

Michael

