Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9E0149631
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jan 2020 16:19:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BF501681;
	Sat, 25 Jan 2020 16:18:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BF501681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579965542;
	bh=kWo8jWLbPdkCJ8AhGqVU7bFCaFyghlXePnbE/Z/LAW4=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qRKaPjnuxSi0TxEwYkfMKN+hbVH8U0f6Sk5N2MmSgDuvU0BGUtiBM7RtsPoxH/D7T
	 KpUWzWu77CsEDFR6e1yPjcVUD8AP5ZHUuvxrbevb7/W+rVUseMjCsYpYduJIvkBc0e
	 /pH4rZ9PxK4J9IZ1uUEdLDYK/9GUfEUIDtdcGGrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59A37F801F9;
	Sat, 25 Jan 2020 16:17:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F13CBF801EC; Sat, 25 Jan 2020 16:17:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EEEAF8012E
 for <alsa-devel@alsa-project.org>; Sat, 25 Jan 2020 16:17:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EEEAF8012E
Received: from [192.168.178.21] ([77.10.30.73]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N4z2a-1jcNPj17Bc-010wzB for <alsa-devel@alsa-project.org>; Sat, 25 Jan 2020
 16:17:07 +0100
To: alsa-devel@alsa-project.org
References: <20200125150917.5040-1-nick83ola@gmail.com>
From: Jens Verwiebe <info@jensverwiebe.de>
Message-ID: <74be5183-ac36-ea82-c64d-09d16bf10fd5@jensverwiebe.de>
Date: Sat, 25 Jan 2020 16:17:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200125150917.5040-1-nick83ola@gmail.com>
Content-Language: de-DE
X-Provags-ID: V03:K1:20D2ffFRD+p/juj7xePBGjNKDJek4qk5/+ldPRH9BpBVZ9eyHeA
 Z/Tj1TKj2YCtRCathHHX7gYQ3RHTFyp1krixTqF98FAPQXBsnPs4FfFH22Q7BnTzL8NbP8g
 WS9a6rYI4PMSGwvRU4TCFJQsVIexufcE5I0kko3It0XOo6sJWCrUtmcJUi21z/wdDLiYvon
 deLWa1ylK2sBW1FMYIs4Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:O+qP6ppRwBs=:HkYOWUCIMC4EdpESJzVTzC
 5Tg4/jAP/bqGns/xLxYSWjlUGYjQpMAr/r2q1Ycn8Eibr7jCtpaKk9AqjerB6oddY1r1O7BNQ
 T8QzcfDUUAXIrTAxFatYo/Cxe3Y2cgJt3s6+TpjSeKraztmodYqXsZNBhDo/HffkTixtOClh0
 Pl20bdIiqewqC0v6TW7EIzI3rfgDX4MXFaeuheYJU5KHhzU3aEDsI6QkdnZ4pguv9ZzXVcYbJ
 GJOz0ZoPEIXp+A1o/0v+bEbLo61yxVWuuV//HvYLgMmjZadfAGwnbCKAi9A+VXV7/k9P3z5+0
 RomM3nrta/MJcYHGr20PkxCbGGl/spYWsAgbPcp75C/VwyKdlJlWDGKp89e51Z29G/KjsXl/C
 Kq3N1pxlfSnv/CqUTV3EF42vUz1WFbvLEj3rmhwWJuPWyiwYVSbb3aIVkGnWbHZwIiR1UQ7MF
 v/GGhaW2RGi7ErPRrc5iv61mGxn840lt2VjiXD0X+HTLDkzdd5qb5tHcr9ABHMaxy1Bztp7pD
 N9nwROxB0651FGLvuvapYIbvbPto0z/pyikLqIiE6jJU/De1Yt4ol8kz0qYA1awOv+4a5q6qk
 t+4RJfA7jUBmVlj5WDn4iNQgf29HbMxKZxsrG5JQLnbhYgswvo5iBrIu209DKvuiWqE1yJ2yo
 u51PKzJTnZn1u3PtUBr3P6MOpJgP9HDrC4nlOASTdYhXe+sV9uwWEntdXnmqteuKl1vZF9RS3
 XvMcCUop7NyWiW/qM2HmrUCyimPBhQ/6ZuSO7hMvhSXplqRrOxHsXuwTA7sgMSHwkDevoolP5
 kkMUcaS2fX4FotIzwU9G5o6IBlWRk4chgItK8vabuYKSBa4LRmqrnVSJ0VS28rzz4QjdzsE
Subject: Re: [alsa-devel] [PATCH v2] ALSA: usb-audio: add quirks for Line6
 Helix devices fw>=2.82
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Nicola

Thx for headsup.

Hope i did not sound too harsh.

I fear you lost a bit overlook ;-) over the forum posts where also

Shemesg etc. confirmed.

All good so far.

I'am also a bit closer to understand the missing sync problem.

Just have to decide if to force an implicite feedback enpoint and make

that respond properly or rather do the more modern way to ommit and

resample.

Apple has some interesting information about the possible proceedings:

https://developer.apple.com/library/archive/technotes/tn2274/_index.html


Jens

-- 

Jens Verwiebe
Allerskehre 44 - 22309 Hamburg

Tel.: +49 40 68 78 50
mailto: info@jensverwiebe.de
web: https://www.jensverwiebe.de

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
