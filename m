Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA291B92C4
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Apr 2020 20:25:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44DC11665;
	Sun, 26 Apr 2020 20:24:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44DC11665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587925510;
	bh=18p5QP8uxOVNqgPVsFClFTg/z60KvMd0FUr+S2U9heY=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tjSDVJpEsuLMEAWykS1HayNk0Q5sRrGu9ZT/xMZOD0hUDHWiX6AEIwkGsgo0lqE2Z
	 Gq745ijepNEa0oyS80PRx/mauMNH9OhfaDBMt8tltOVO0MxpZHnkZtw/guyk3sqjq7
	 Apy/5F3EZvxh3ZRU5H0kXvG4foVvwiSEX17MXEKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 661DEF80105;
	Sun, 26 Apr 2020 20:23:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B21BF80136; Sun, 26 Apr 2020 20:23:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05olkn2085.outbound.protection.outlook.com [40.92.90.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 597BAF80105
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 20:23:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 597BAF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com
 header.b="kYKTpGng"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaRz4DvJDZBVQT1aCeQT65UhSrMWNkSowx5SPSZ1O4pBcpqtYNz8Z8hkGowFxjUMuCR3vGscS8/KriFjc5En10JdIk4PpynRK+yhjDACI/MVaxRpywBzidFqrUb5Vzukg8vBXl6YbAKTetf2f3s5P+hlNL8+HSlQMFZ4LBhKiLrC+AKUFFYiGAYboJEMbHmWBUSnj0Ej1CJDC8h6WXnelPZb/ZtXfQcJvdV2C7v0vCZwH4qKxG/iJvbDIKs6+Xg7+X7YYwcprL/1yoIgs41+w5G8IrfCiLtJXsU2NBrc0gjqBPYO5PKnEldwJpfOVz/W9DJfWwKTGYRzYIxF8o35+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S962swYfiCZNj43Tig6/WpUjBTwzCSbrJxf34TgP+b0=;
 b=JEigHXsxhP7xvAMYpb94lP3k9zr6YsBUtoWx0hQXr6ibduJrbMt4x4SgJgVYOUuuz7IihLsoGvA7WwgRQPSYdhaYQuCbxrRjI1h/TtxSso18PwHNmy7ElQ/9vnaD2R5yd5q6IICysZ7Ro8AVyAX1RElcYk9SUfaKGXQIuW2iA9ZLJzl8/PaNfHwHTy9LOt2zRQVthb8/AFMYzQvLaGYGeQPv09evLqUC7DocD64egit7MoxCtDWPwOjBTTR+oJjyzWJBZ2OPAvobY4XJmg5ckIvwh2uPxAzboOndjwtkuG+xURKZevVBM8MVIWwvXddXoPFc4btXoLZH8mZQAm5q5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S962swYfiCZNj43Tig6/WpUjBTwzCSbrJxf34TgP+b0=;
 b=kYKTpGngMmLY4yDWO4EM4UtYmmPQ4nmTTualXYhmmrYwXuoMA6JteUl7m/0GCdNw3srNmc8rgsPEHZEGRwH4TUl2jo9T7pZKSjhBCO5Fi++JuAC8kTOZFSq+b1LKXGeV/CZd/WKf7uoNeyW6iJMUxp8M03V8aZzdljt0OxllS8ZqTPqBdd4VEFMaJmR6x3Jpi9m4tZ5TSd2WQn4BVOqK+sonvrlwwT852BAyDnfBSEhIjoTzBWwvlE9eDczMZoxegCGUDRI5z6BP2YANcq/nssUBncL9yqtzcCaDrNZ85F6mE/NSlfwh4N9NHMvIm0YWnZjqTXUCXpFiaqFMy6nXbg==
Received: from AM6EUR05FT044.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::52) by
 AM6EUR05HT192.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::88)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15; Sun, 26 Apr
 2020 18:23:21 +0000
Received: from DB8P191MB0998.EURP191.PROD.OUTLOOK.COM (2a01:111:e400:fc11::4d)
 by AM6EUR05FT044.mail.protection.outlook.com
 (2a01:111:e400:fc11::425) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15 via Frontend
 Transport; Sun, 26 Apr 2020 18:23:21 +0000
Received: from DB8P191MB0998.EURP191.PROD.OUTLOOK.COM
 ([fe80::c8f9:cb6f:e324:3847]) by DB8P191MB0998.EURP191.PROD.OUTLOOK.COM
 ([fe80::c8f9:cb6f:e324:3847%4]) with mapi id 15.20.2937.020; Sun, 26 Apr 2020
 18:23:21 +0000
From: Stuart Naylor <stuartiannaylor@outlook.com>
To: " alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: FW: Does the SpeexDSP plugin work?
Thread-Topic: Does the SpeexDSP plugin work?
Thread-Index: AQHWG/LWRWscNqb4pUK7md09aXRgmaiLtuX3
Date: Sun, 26 Apr 2020 18:23:21 +0000
Message-ID: <DB8P191MB09980A2D349568F0083F716EA8AE0@DB8P191MB0998.EURP191.PROD.OUTLOOK.COM>
References: <20200412043143.epf7wwoxlmnnukeb@fastmail.com>
 <26185986-cc09-c6fa-505e-e36490a86058@googlemail.com>
 <20200421181941.lmqq3bxlw7ifyiaa@fastmail.com>,
 <20200421204953.6sdbhbfc2jcmi43j@fastmail.com>,
 <DB8P191MB0998910E9863EACF5EEA16B7A8AE0@DB8P191MB0998.EURP191.PROD.OUTLOOK.COM>
In-Reply-To: <DB8P191MB0998910E9863EACF5EEA16B7A8AE0@DB8P191MB0998.EURP191.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:04AF5D71DE73FEFC3E9A5904395E12F19775A3B3AF02C29C4492958785354B04;
 UpperCasedChecksum:8AF4E355D9582AE629ECFFA93FC09566B9E920CAE2100161BDC46EF0B15AA0E8;
 SizeAsReceived:7077; Count:44
x-tmn: [aTfHkR/CvgYiEBNsGtlcpvnePykCrjRy]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: b10470fe-6b00-4224-34f3-08d7ea0ee6cf
x-ms-traffictypediagnostic: AM6EUR05HT192:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mTkSRhqJsrm0/WicOpAcvejEj0QBAK60mdjYFT8cT2s7lB4FOz8ceCEcqbTdb+c39F6pdZohYRpLhlqoo4MkFaOy4rVWhfwbFslyncfb2xtU95aMFkvPLlxC4pGb2TTr58pLlOaOUYdohZY9iQK5Hq/OU4mNQO6Pp7AB/DEnfYsoDjHJrBWT+7yWKI0ge5I+q4qFo9sA2nQLjmWT3MnahqTs1DAoAsKSYxhLIXKZKBYSWNvIssKbHGQ0bDCDEuyG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8P191MB0998.EURP191.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: C31JzdnhY4knM417S7FEsAir+HIvkQCpVPkBgl2JeX1RADLMfbGg4pa1VoEm83CyWNJqyPM5E7hkjZ8TMhJ15m9ecOy3gNaWxJQVx4QhjcEOnNCy07Wf7r3ekJWc6KxLsfgxsSWv3Cl7oEUfHfGCzg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b10470fe-6b00-4224-34f3-08d7ea0ee6cf
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2020 18:23:21.7860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT192
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

I have been playing with this repo and the results are actually quite good.

https://github.com/voice-engine/ec

I have been using exactly the same parameters with the following.
I have sent this to you guys because I am sure something is very much wrong=
 with the plugin itself.
SpeexDSP works OK, the above repo works ok, alsa-plugin speex works excepti=
onally badly that in terms of audio quality it doesn=92t work at all?

# The IPC key of dmix or dsnoop plugin must be unique
# If 555555 or 666666 is used by other processes, use another one
# use samplerate to resample as speexdsp resample is bad
#defaults.pcm.rate_converter "samplerate"
pcm.!default {
    type asym
    playback.pcm "playback"
    capture.pcm "echo"
}

pcm.playback {
    type plug
    slave.pcm "dmixed"
}
pcm.echo {
type speex
slave.pcm "agc"
echo yes
frames 128
filter_length 4096
}
pcm.agc {
type speex
slave.pcm "capture"
agc 1
}
pcm.capture {
    type plug
    slave.pcm "array"
    route_policy sum
}
pcm.dmixed {
    type dmix
    slave.pcm "hw:seeed2micvoicec"
    ipc_key 555555
}
pcm.array {
    type dsnoop
    slave {
        pcm "hw:seeed2micvoicec"
        channels 2
    }
    ipc_key 666666
}

I really don=92t understand how the above repo can do such and excellent jo=
b and then with alsa-plugins it can provide zero EC and also vocode the rec=
ording so badly?
Surely there is something wrong with the implementation?
Its doesn=92t make and sense unless I have the above asound.conf wrong?
But https://github.com/voice-engine/ec works quite effectively?
Stuart

Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> for Window=
s 10


