Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 103BA39EEDB
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 08:44:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 898FA16A1;
	Tue,  8 Jun 2021 08:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 898FA16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623134692;
	bh=AGNIlE2Lxhi3FqaMf7DlqUw9z6wsyG1zyjS37ID+7dA=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b44dSuCZ57qlaIUuQ1XqfpgwZzDSuIsiEoXeHWbfiwZt9jDsgaPszwEHPSfzdqzCe
	 5otdh57U4EQ95rss3pcvPPTMyD83vtQqbChUC5XYPiWNP8lP3CeQTzgUULZwRwx7H0
	 lXC51++QzQwNSUb/HwoHQtjoOayLv/2iShDN+6Cg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E97E4F80227;
	Tue,  8 Jun 2021 08:43:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CC11F80218; Tue,  8 Jun 2021 08:43:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODYSUB_1,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4F9BF80116
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 08:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4F9BF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="kTIaMDGu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623134599;
 bh=AGNIlE2Lxhi3FqaMf7DlqUw9z6wsyG1zyjS37ID+7dA=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=kTIaMDGuRGloEVf9s1mSqnUTh1YGUjGLlQCI+6SPmJXIU+iKmGCmlF5xcohz1i93U
 EWvEJE+e0Ch1rRaOamVRujD+nIgNn2tOjVjiR+5qsm0k3C/GKB4Yuvl70MOKTZahzy
 RH8Fl2JqkJZoHAlDQeX6HDbBu8FQzvCgdOoc3hi0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [93.194.223.136] ([93.194.223.136]) by web-mail.gmx.net
 (3c-app-gmx-bs25.server.lan [172.19.170.77]) (via HTTP); Tue, 8 Jun 2021
 08:43:19 +0200
MIME-Version: 1.0
Message-ID: <trinity-94e0c40f-401d-4d9e-84aa-f533d548ee7f-1623134599278@3c-app-gmx-bs25>
From: Roman Muller <klangrausch@wolke7.net>
To: alsa-devel@alsa-project.org
Subject: Xone43C: USB communication
Content-Type: text/plain; charset=UTF-8
Date: Tue, 8 Jun 2021 08:43:19 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:P76v2fQerAcDiAfGJ0+1zgfEF976j0WkcmuQ1Y83OAz0VX5vqxZvrN4tDzw+db0wz6iw2
 jTn77LawKRddQSY+6gBkqKI+BsK54ftd4CiV1L6jO1IEf/BeUIWAksT29989uVj/rMsqD/tYH608
 Uh8PPjV9uvuVB5fNfPpVAhg7Q5cwfZDHXEnYPMqtR/9jDuUD21HJyCGz58SDrhD47cz6TwHc6ybJ
 eisKK8Hu9qaGYeme/kYg0fxvB3TOXwPqHK0+/EHOYFCfTN4jMAVBM5JCo2OHyCuqoOGxkO/dsKKN
 WM=
X-UI-Out-Filterresults: notjunk:1;V03:K0:VIQ0W2Dzpbo=:UG8KgqElruVtiNE4B+zxZ6
 uwqmFdhQeIxZZluLxbFqIJ7YQAgxGOio6xse9ReOj/u1VlN1d2WjW1Hy5O3tsMK6fg8KaNtfl
 /YTLfbLFhnOCJo4KBRt8uXQaagEja9fZOQbyyDsuJQJhx9Z47L04D9Cyf/cuz6ryPwe/7Hpve
 8bdPaxW7vm5W4A7HO3C1GAI1vIBb7KfmR9SlNhy8SMS2ApRoGk9LsievS48YaGG2enr/xc6io
 UXEr3dxS4a66Wz2HnhqTdzstrIRkZJcMJjfcqTHXkCGbh/4Js58DQXs/8OD6NEzTjU42t8yh7
 WyfEYi2yZV0ZwY9UL9wuGK7qLnATHPbhcb9kUkoKLPhBc9r4LvbvoGnUsADa8hTh3k1WGF7AG
 gyBU5HRe9rMFwDwEnQMspHyV8Oeto+WU2lUQN/41JlRnJS/+YapeDe6YADABJpkogAJ/jiIBr
 B5Saw2SFFF9Qv1LjQF7YsySuZ9rp3XYbkwKLjwoKFeBiwKXJLq8o2Zz8acCImCOwAKvFdYZsT
 S3BxeiyeSFivvcJdps3Gz8MqSWrm46KRzHkQ64FMzvQgLgn1ZAnHpkQYmQjX09vK4v4Ay0Jwm
 LG+WYOrtYMXpS4sl2hXDLX7LI0p4sAyBqp8awvZsjL8hccXlO1B3hYMU5o6AlWKc+L+6N3Q4C
 ignLuj6y32zrxyiJROr9oO5+6vZeptJg1djxoLjiGjpnfjWS2OUiI7UTwO0fH/uyAl3uysBXm
 A/XkN4Ky5rpjO7BzxY0xuK83UUsGaHULe8b40YnNHddf8Z6f9LBRQY4ViWm5UBtVbMjYTMc+M
 kGHNGVasRaKUtQNjAA8nslo2ANXOyxzFDdbPkJ1dTTgEiFoEmX2lBAVltNUc7stoFbfDFs4
Content-Transfer-Encoding: quoted-printable
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

Hello Geraldo, hello all,

sorry for spamming the list with such minuscule details.
Thank you for your message! I did not hear from other people yet,
so it's probably safe to assume that no one else is already working on it.
Adding a section to the quirks-table does not help, the vendor-specific
interfaces still don't work. Obviously they need extra initialization.

Next step: sniffing again while running Windows in the vm.
The interesting stuff is going on here:
https://drive.google.com/file/d/1IlkR4ey9Gwsdrrf6jfOwNUVDtGcl_93-
(Full log: https://drive.google.com/file/d/1VmSGVk8V1saw7qdPfbOH2d4HmZTrlz=
xj)

=46rom this I see several URB control messages going back and forth, for e=
xample
the host sending 80bbf0, and the device responding accordingly. A bit late=
r,
and after sending 44ac00 six times (hola!?!?) I get isodesc[0-7] cross-dev=
ice
link for input; and once more for output, and the device reports success. =
These
appear to be my eight channels. So far, so good for a first basic overview=
 of
the structure, but the tricky part is figuring out what message is doing w=
hat.
Only the manufacturer knows it, I need experiment and guessing
with a lot of time and luck.
Is there a common agreement where in the source code such control
messages should be put? Probably an extra file?

Best,
Roman
