Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E078D2E85CC
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jan 2021 23:21:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63A2E16BC;
	Fri,  1 Jan 2021 23:21:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63A2E16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609539711;
	bh=jMwXiMjRPNgjy8AA61m/2S9siVt4OWWaNSlKQ33wBSk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f5U/eZVqn7jgIAMfgYOrnRZThL5pxtQqijxb+5PfgUgdSGklqpK7uIZWck5q6DvYX
	 U9Qx7IugDQpRA1LyzuP6zrZP56X1Bh3VhaHshhesLW6tmkQ1iL65iuSjowmLPtaYph
	 v02BnPvaGHj4JDdPd++wjj3cJ5/AiVVNM61GmtRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70DF8F8020B;
	Fri,  1 Jan 2021 23:20:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3609EF801F5; Fri,  1 Jan 2021 23:20:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CADE6F8012B
 for <alsa-devel@alsa-project.org>; Fri,  1 Jan 2021 23:19:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CADE6F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="UHfQ+4E8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1609539590;
 bh=jMwXiMjRPNgjy8AA61m/2S9siVt4OWWaNSlKQ33wBSk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=UHfQ+4E8+6bt7niXqDPg9a/Bs8CVJccbrLd7hichakV7H7Wi1WmZeaHIhWtCdri4V
 zyFBSGZDT+hzmXhMwg3bdU4JEOM0V4nnt83oivBV4ns2F8fbRdhcSzPhckcxzx8bdx
 sPEGWOzBsfEUjG1j/q/hc1wHQQnp892KYhzBYHQw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.57]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MirjY-1kPRwY2E1k-00ewkT; Fri, 01
 Jan 2021 23:19:50 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-doc@vger.kernel.org
Subject: [PATCH] docs: ALSA: Fix reference to mixart.rst
Date: Fri,  1 Jan 2021 23:19:42 +0100
Message-Id: <20210101221942.1068388-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u4OdV2KYuu67DbBoGJ+25LQDNFC8odVCZqA11wCKXavaJOYVKwA
 pcmu2JFhX/flR4D295h0ysUXE/v10ePDzBCr9IcbGlq0JWlwb6h7OWQC1bcDQ46QmQdk8tq
 L4W/P8d00ttRVpzgMypWKdezTwGZ18VkVUIiuNlfbs//F0mQEi7GdSiGLvfeVZdUOSzcTNH
 STehxjVcTlsvITUojTv0A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:n+OgFaAHS4w=:sAJG1ANtldmAofN6xRLV+u
 e0siHJqME3EYMHQ/iVVlV0bwsjj9QHlSHYm18twbi4ELiu4RkcRu6xT8eQadCEP05Qg+KW/tL
 PEInvzoLsz71c+6u+rbSmtGhn33gQxPNi0cz8EpKS5rKzBUaPUF7Pm++NhM+QHdwSRxwqOQAo
 xabZOhEQ7uD7A+BUyrTqPzIVaAiiBR2GCDPd5x6s4cENQZgKkUsNQf3Ca0IOBxvNjqlwA8WxK
 jdL14vi4QJl2zVYQN7NjLd8c5FSxQIQXGMdbFjJ8X0i0ogyr5KjdYiuhF5e4zxW/EvxWmB9vn
 gklr3msPag3uIhPZ/e0fXJoBuoVQIwOzUVzbxjC16uIFZC4+EFwwPHNYN1botom4xNUhzkpSa
 M662+Bk01E+bSrGKGe81v8oqmh+ncGt1XH+TXuOhCyRnOfkphN5WhWGq3fcfl/W/ho4txXAv/
 P79l2ZfAiB5QSaZ0bOAK4Rm/0H1qAGlBnhBTd767Cw+1WLyw8BZZQfphEPkoVVKBLArrAdKXn
 8eAT8SAJsewfUK/1l7i4BirIdAB5tXiF0m3InKZ9j66dexUkMpAUGoqb6C/6LIJcph9S6gr0b
 Lz9WBBLXLYW2IGO3ludLk/jVUPK04X6YPtoCnZvSsZO/LQmXJVVSkET1ICASPjU5tC5XzEWIg
 LB6v3Kxhi6x0zi9AfgHoX2ns1BJ2VdzaPqpB8xwpJ2OUnzEyKAQn7jKoFemY8FgrXsOid0tPp
 0n0VdrQGBUl1MIdpKBzCpNs56kNKqNRHg0G3jDoGE+eBENRqgHsTKjBVXpf2dea0HrNNDEsu4
 olls2alLEG7/8PT0VpHdx7BTqs01mzo+UqU///Kc1PXYyUdtyKx878Q3dF1LQdceafP5NUAoi
 H12oeTUaUnKu6Fb9ZL0g==
Cc: alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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

MIXART.txt has been converted to ReST and renamed. Fix the reference
in alsa-configuration.rst.

Fixes: 3d8e81862ce4 ("ALSA: doc: ReSTize MIXART.txt")
Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 Documentation/sound/alsa-configuration.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/so=
und/alsa-configuration.rst
index fe52c314b7639..b36af65a08edf 100644
=2D-- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -1501,7 +1501,7 @@ Module for Digigram miXart8 sound cards.

 This module supports multiple cards.
 Note: One miXart8 board will be represented as 4 alsa cards.
-See MIXART.txt for details.
+See Documentation/sound/cards/mixart.rst for details.

 When the driver is compiled as a module and the hotplug firmware
 is supported, the firmware data is loaded via hotplug automatically.
=2D-
2.29.2

