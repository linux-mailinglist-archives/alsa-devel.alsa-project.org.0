Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 951F81D550B
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 17:47:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3613F165E;
	Fri, 15 May 2020 17:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3613F165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589557678;
	bh=rPNnzzTn8DGyHpe5ighh4Mhv6ROl7rtvhg5zqY/tbH0=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dV1OmiiRT8vCJL+vxfFMwW4nu+v3KreU2Kgq3jW/1pjmXChzEwfiH/hcOTAWFobsm
	 IptnjXExt/RWENzCrs2xL2K4wt3u45WNYazJ3iMJRxWoiBGQybQ0U0nIRbNvEYdKfm
	 CpFntRZja4CcRjLjXoi+7dnV0LwK2EoA0k1ZVNNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D2E4F800B8;
	Fri, 15 May 2020 17:46:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BC4EF80247; Fri, 15 May 2020 17:46:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FORGED_MUA_MOZILLA,FREEMAIL_FROM,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-oln040092074043.outbound.protection.outlook.com [40.92.74.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34685F800B8
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 17:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34685F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="OFR462X9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+RF0+P+8T7N7qmyG5QBeAU5lqTNorPqxSoUZCD+QGmZzlvQ2ZYgy5r56VpZuamO8k13dUDeGpMloIy42hwHSHgClZXAQ/P9k4EseA1HZBf5WKlTdJ5rSSQ3jXQDgdyxALMoDsE/Hffzo9BZ1xbO8/kNZqoiK4Ed3+VQpexd1G8TQqf9e2g0kPJE7TAD9vs4p92wWXoUDBGVwFsO1Vm09LsLxIwOSCLe+fWtWkvvNjnj775ui2wouE0UH5psDjyO2dMbam8bx26d3JvwzNLD4c0d8pVxdSyBV/RZk4quX7J8+BiBIAF22+q1NR7KZsLXA+6e5uGqQgGPdTf0p/GHzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/kjokHJlaUQDhIY1KXAumOlssdA+hnI65zrhpnFPW4=;
 b=VkeVZhUUOx6yhsND1EAbuQakoKqYXZ4kXt+PBNfM88uI2DNWoDgQZV95VrlJ3QpJ5GvjerZ05H9JUOcKU2iTucT9DesxxEnUYpokZM475mmWRKl69sGuqF9GIRisLuf+LlaWRYeKeurwIMqRtKg8n+sPS9VSA4wFgwJJDicsBVmmyC/D8c0iYTnhrjaFJNO9GxBf3kAHMmhc3pbfnZcwZoclKgmq96ZOr4H54wjCi6NHr8iLHs0i4KVETiJ/8sk8hf2jtqrzzvx3/D1gasPtgw0tXuxWpoodEWOaK0a0zzyWyL12pvp+d1cUC/OPKRSd9HivS5dFDYF/LuIei91C8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hotmail.com; dmarc=pass action=none header.from=hotmail.com;
 dkim=pass header.d=hotmail.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/kjokHJlaUQDhIY1KXAumOlssdA+hnI65zrhpnFPW4=;
 b=OFR462X9HENbKkNucqlIhMyJUWpBbOlBUfxKNYiUw4zxDulGt//LRaYImfowzIthe5jvBKCcB1ARH8WAA6GX4KhhPHiFh0dsHp+g+5QlnzNuNsFNSKVlNJH/57/FspW9QzdqFbyhOLqYipv/sC6b1s5oNWflJO7G9YcFKZZe7I/ESkrvuNPwENvQmMceZD1YCLg9NAe3YKCad3Nm2X+cAJR2+gfSsOH3+m0WnV+iO66ftN3IEVl7QDy+cxipz+gBLUpkVOvLsGLaBM1tKyXL5Yz7K5u3ANZB2M1mlZgY/synbbGsAlQr/FxwOT9m8aJ0Q2dbochV79Osz5D/wv7QMg==
Received: from HE1EUR04FT010.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0d::46) by
 HE1EUR04HT094.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0d::348)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19; Fri, 15 May
 2020 15:46:05 +0000
Received: from HE1P191MB0153.EURP191.PROD.OUTLOOK.COM (2a01:111:e400:7e0d::52)
 by HE1EUR04FT010.mail.protection.outlook.com
 (2a01:111:e400:7e0d::280) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19 via Frontend
 Transport; Fri, 15 May 2020 15:46:05 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:1713B7AD15E0E43BD000BFF6161384E2CC38560373F1FF6EB56B86C8D15685A7;
 UpperCasedChecksum:3CD498F1458BB4D1E574A1827DC1AC6EF3671717C282C0E74BB6A3FA14707ADA;
 SizeAsReceived:8599; Count:47
Received: from HE1P191MB0153.EURP191.PROD.OUTLOOK.COM
 ([fe80::8dd1:2eb0:a33c:bf69]) by HE1P191MB0153.EURP191.PROD.OUTLOOK.COM
 ([fe80::8dd1:2eb0:a33c:bf69%6]) with mapi id 15.20.2979.033; Fri, 15 May 2020
 15:46:05 +0000
From: Maarten Baert <maarten-baert@hotmail.com>
Subject: Lock-free dmix considered harmful
To: alsa-devel@alsa-project.org
Message-ID: <HE1P191MB015371D61AF81262BD242966E2BD0@HE1P191MB0153.EURP191.PROD.OUTLOOK.COM>
Date: Fri, 15 May 2020 17:46:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR07CA0020.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::33) To HE1P191MB0153.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:3:c8::22)
X-Microsoft-Original-Message-ID: <718c8a2a-5b59-7fb9-5da0-5b8af449ea8e@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.101] (81.246.190.254) by
 AM0PR07CA0020.eurprd07.prod.outlook.com (2603:10a6:208:ac::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.11 via Frontend Transport; Fri, 15 May 2020 15:46:04 +0000
X-Microsoft-Original-Message-ID: <718c8a2a-5b59-7fb9-5da0-5b8af449ea8e@hotmail.com>
X-TMN: [V0zqORsemWdX03k0uoCueifDn3KZbRdb]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: ccd10c41-9fb1-4e11-0417-08d7f8e713c8
X-MS-TrafficTypeDiagnostic: HE1EUR04HT094:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y+3qgsZCVU4MqNxEBs7MyjIGMVK3eJ4vqtyKva3TQQvvBplPCGDw4Eq6C3sh0B7RJ4364vIChzuCNLUyKBy4dmv90N3QGnM9CeGbe7e6/erPb6tg15Bf6bOdo2i95iWgl6RAEyW6QHdFIpDaL7J/EPYSYrZ/wbsDCgWYl3aLbuDp0rCUDsyQUEkk5n5+kM7IuKEvo1jjBa9yxWSFzqb+EIWTNoxYe6Y2avKEz+CWshAUaLVIoOh+Tlo8z5XZxPYo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1P191MB0153.EURP191.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: gJOLuavSHLB9vDR0Slef5w8mOk+J3UJwat2gMUphgghou24dbKs0LfPhIJh7uCBQd04ONoo7b9a0T1Dd53d3haypiyByQLlOAHZEMWy3L6Qew1wGUZxdKre+h3uv6PsojUkH5z1AJQcQC4TGzWVFXw==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd10c41-9fb1-4e11-0417-08d7f8e713c8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 15:46:05.5760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR04HT094
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

I'm in the process of adding monitoring support to dmix (i.e. the 
ability for applications to capture the sound being played back through 
the speakers) - expect patches for this soon. However while reading the 
dmix source code I came across something weird. Dmix uses a lock-free 
mixing implementation based on (architecture-dependent) atomic 
operations such as atomic addition and compare-exchange. However at the 
same time dmix also uses a semaphore to prevent multiple processes from 
accessing the shared memory buffers simultaneously. This is redundant 
and makes the lock-free implementation rather pointless.

Out of curiosity I decided to measure the time it takes to execute 
snd_pcm_dmix_sync_area for these three cases:

- A simple locked implementation, which acquires the semaphore and then 
does mixing using the non-concurrent code from pcm_dmix_generic.c.
- The current (redundant) implementation, which acquires the semaphore 
and then does atomic mixing.
- A lock-free implementation, which does not acquire the semaphore and 
does atomic mixing.

The resulting sound is identical in all three cases. (As a sanity check 
I also tested the 4th case, non-concurrent code without locking, which 
as expected produces audio with glitches.)

I tested each case with 1, 4 and 20 simultaneous playback streams 
(multiple instances of 'aplay') on a system with 4 physical CPU cores 
(Intel Core i7-4770). You can see the results here:

https://misc.maartenbaert.be/dmix_perf_locked_atomic.png

The results are quite surprising:

- The locked implementation is 3 to 6 times *faster* than the current 
redundant implementation.
- The lock-free implementation is usually about as fast as the current 
redundant implementation, but has extreme outliers that are up to 3 
times *slower* than the redundant implementation when there are multiple 
threads.

It seems that the overhead of the atomic operations is so high that it 
completely negates the theoretical advantage of being able to mix from 
multiple threads simultaneously. This may be the result of 'false 
sharing' when multiple threads are accessing different words in the same 
cache line (which is almost impossible to avoid when mixing audio).

On a related note, I believe that I have also found a bug in the 
lock-free implementation. The logic which is used to clear the 'sum' 
buffer is as follows:

sample = *src;
old_sample = *sum;
if (ARCH_CMPXCHG(dst, 0, 1) == 0)
     sample -= old_sample;
ARCH_ADD(sum, sample);

This takes advantage of the fact that the hardware driver clears the 
playback buffer after reading it. However it does not account for the 
possibility that 'dst' might be zero for other reasons, such as:

- An application plays back silence.
- An application plays back sound, but then rewinds it.
- Multiple applications play back sound which just happens to sum to 
zero occasionally.

These all result in situations where 'dst' is changed from 0 to 1 by the 
compare-exchange operation, but then changed back to zero later, 
resulting in the classic 'ABA problem'. However this problem is 
currently hidden by the fact that the lock-free implementation is in 
fact still locked.

Because of these reasons I think it would be better to drop the 
lock-free implementation entirely and just use the existing 
non-concurrent architecture-independent implementation from 
pcm_dmix_generic.c. Aside from being faster, it would also eliminate a 
lot of architecture-dependent code and inline assembly. Should I submit 
a patch for this?

Best regards,
Maarten Baert

