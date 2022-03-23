Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6C14E4A32
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 01:50:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5099916B8;
	Wed, 23 Mar 2022 01:50:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5099916B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647996652;
	bh=spQiqATUbz/AcG5quigRCx61gNkrwgN6yk3kJY+m11s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pDnJ/MzYuhnZJBAk7A7Z6bDATgvmrKMmdDBuop1Doo8tf9QgbHOOeUB9bdYDElrcC
	 Pnr8tNPV2+MVg2rgezzCH4a8futwa/a5C0inqRn+OAjZCmhadxXqn/YwIog6cXi230
	 aJHFyPVn0ZnLIKv+ISDxi2fqOvvMhYK3Hzqga8hk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86BF4F8032D;
	Wed, 23 Mar 2022 01:49:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C2F5F8016C; Wed, 23 Mar 2022 01:49:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mout.gmx.com (mout.gmx.com [74.208.4.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BDFBF800FD
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 01:49:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BDFBF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mail.com header.i=@mail.com
 header.b="I4B+pu5w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com;
 s=dbd5af2cbaf7; t=1647996575;
 bh=spQiqATUbz/AcG5quigRCx61gNkrwgN6yk3kJY+m11s=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=I4B+pu5wNRTSoQdKCi0cg2MKXg4yCRCA7M9tIG94r+BkMFdKekU17N85fPIXEkHGY
 RYwpC9HX+u4heg+SDSq+9sBks1LYSASEP8EFQi1H7QxCG1t6awv4tN/WzwKTzRTehU
 EyI39lB8V5CfoFKTSosoGQpzQGgRexkySb970pcY=
X-UI-Sender-Class: 214d933f-fd2f-45c7-a636-f5d79ae31a79
Received: from [97.107.220.18] ([97.107.220.18]) by web-mail.mail.com
 (3c-app-mailcom-lxa08.server.lan [10.76.45.9]) (via HTTP); Wed, 23 Mar 2022
 01:49:34 +0100
MIME-Version: 1.0
Message-ID: <trinity-f4c3906d-34c6-47e3-8748-c7ac941b3a0d-1647996574956@3c-app-mailcom-lxa08>
From: fenugrec@mail.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: realtek ALC1220 : recording samplerate 10x too slow
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Mar 2022 01:49:34 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <s5h8rt2xb2q.wl-tiwai@suse.de>
References: <trinity-0bb2f400-d9ef-4368-8ab3-5acb07a11fa3-1647900111584@3c-app-mailcom-lxa05>
 <s5h8rt2xb2q.wl-tiwai@suse.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:d+04oaWllsS3CdQ3IIgCwTfnMIJP/Y0hD199IRJvO9wZQ1g7thYVN0ZFx0O2KG5dbA3xT
 oC+gZCm0j7Pv8p7f9kZ8WUT0ZegW69L+CtI+uYcel8SRjZy+SfDGC5WTD+yCKty4LScwyzNLqOXi
 GNx8NUaMWxzigkhb+cVPC17i7P/KFDPMXHFf7tO+6XiO4p7IA47+jZHkflQIiBYj3wfWqFvaqWlz
 C0oKfA5mT6R83tNIJxWFU1qFuii8h70qjmHCJ8miwbg9c+4sDtiH5Or8HCcE6lsHAKLMY3Ac7Tli
 v4=
X-UI-Out-Filterresults: notjunk:1;V03:K0:hY17UwVE3sY=:IzNe+DeJmfeDDWs9jXNCZt
 xP4JTVlf5pc+qkUaYO1rMxm4PuoCIosKuD/+r3JAtJ4HVvt2dcLC65FxnFcNqRPKPVhF/c9CL
 ObAa3vmng8TPwBxJRv10MdwUbQ3cvsSUaJcxe1LNrmLUhQYiFeWjVT6wZnMCf/PxOmluMKM1m
 TevklV769ApTddYrpeRVbAXSPwkh63T1ho+QxjgPyzmCinQik7ozi2XNeTiwtci8b5w7b3UZl
 Qzif//bTXJjsmdT3YUkDRIxAO7vZFqdVgkAZNZyMba8xU/8IhDoFP/+VaZPUyjdpeLLFOrGPb
 FvpwGyX4BzHsmd+SzMOfodypv2gYbulyM1kZWANP70fbU4Acmqj8+F39mSZSR7BpTAwoAlqON
 p6cN2+tZx86fvV1apGRXTfW/udJSFmy2B2qmz5Z6uErplEXdJH+I3Xw0n65My4Uf8Rwhx0hbC
 FUcTgpo5Ky8zPUY+i4hMmPhJPJH4ptMbVRWlVgXtMEvTAky5Lb+ow614Dtfw1f+Qf8OaQOKdt
 uWvi2U/U+N1kzZ4omAd8mxVhZtStpTBR9X0DNV1SDqcySVjDpV1QxkQDWWhTU9tpRnlrRECZJ
 P68WCL7ICCDHz8aougBjChivQOVtsBQMs7IgF40ohQGPqvQK5cc6FVg8/iH2afqR8iOwvwbpE
 GAtY/oA2aTJupR28zYh4oW9q1TTNasYzGfQ5lBETi4WoT0Q8PUKPx0f6AUOXJImCssKNn3WGk
 NCgE/eBgmWCTUb8D4ftzfzBi05I1NGjl0kR5HIJI0ORNjUCBhV2imMTuLUu5CQ8VzmvTmcCsg
 T8JX92i
Cc: alsa-devel@alsa-project.org
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

Thanks for the reply.

> Is audacity recording via pulseaudio?

It's set to "ALSA" for its host interface, and it doesn't seem to offer other options.

Other software like obs-studio works fine. I haven't done a comprehensive survey but I'm happy to try other methods. I doubt this is an audacity bug since even after exiting, it leaves my audio device in a broken state.

> That is, if you keep arecord running (over pulseaudio), and
> start audacity in parallel

Good idea . I just tried, and the recording becomes garbled at the precise instant where audacity is started !


> without the need of complex sound system setup.

This is already as simple as I can make it .... reboot,  run arecord / audacity, and the problem is 100% repeatable.


Regards,
Chris
