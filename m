Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CFA527359
	for <lists+alsa-devel@lfdr.de>; Sat, 14 May 2022 19:45:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40B831816;
	Sat, 14 May 2022 19:44:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40B831816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652550308;
	bh=xBpGrdjI/3vbztaM1ftQo1WWr+ll+pLUp0JmNl+E2SA=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=nFmGVZLdLA7njG+76oQNO0C6qDY9yDfV9iXTCjGW/9pGwzIxKYtIvWFP5uYqP780l
	 FGPYs0frVG2/eTDUyHgVYybRWSI7Eq2VosnzHcvHOSixrjJwEfyfPv+KotpyTFkpXu
	 C2HJ1/BZ9ZGzu9+piHvHceB+1WNVd3LDbx7f+6j0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 983C8F80083;
	Sat, 14 May 2022 19:44:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3886F80083; Sat, 14 May 2022 19:44:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69A4CF800BB
 for <alsa-devel@alsa-project.org>; Sat, 14 May 2022 19:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69A4CF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="cXhEcRKR"
Date: Sat, 14 May 2022 17:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail2; t=1652550240; x=1652809440;
 bh=xBpGrdjI/3vbztaM1ftQo1WWr+ll+pLUp0JmNl+E2SA=;
 h=Date:To:From:Reply-To:Subject:Message-ID:Feedback-ID:From:To:Cc:
 Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=cXhEcRKR8grXGKzKWUf3GeCXtd3wFxoj35bkkxgKe20uooRIV5BS+d26JJ7hvIUuF
 sXobB1x3G2eHIovjhKc2/YqSOcwGDPrQbWnPfIZ8e40AHl+hh4+IbUrQ1cBgBzQ/+b
 IgWEsgBDRfFhQ1Ai1mxbDrWzlqvNylQuL1NQtkBWNUu9ySbmSX2PqYHezN1VU1J5t5
 BxLyoUs+c+ZMPAFkAHLvtO9zM6Kz2d/s6dPuXRBwUdAWenbB9Tfd0uupeBe8uRdCDL
 xVxqj4pjChTUNuYPCWzTOWGLbwmCvcgWUx/GCUjLdzXtcopUwlHoRlZtFxj9L9YJ+/
 oFpGswn/YwOSg==
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Peter Wedder <pwedder@protonmail.com>
Subject: UCM2 configuration guide
Message-ID: <VwoP3j4nu98HV-5itWgDOdFuspSQQHQI_W_SS_WSy25y82ZLj0VupitgOTUv0AmrvI1q7Xx6gJHtm-g68W8QJWgpndDFrd_f-SA8pNp0qp0=@protonmail.com>
Feedback-ID: 42199824:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Reply-To: Peter Wedder <pwedder@protonmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello,

I have been working on an article to describe the process of writing UCM2 c=
onfiguration to split multi-channel devices into smaller devices, particula=
rly in the context of USB audio interfaces. This is a common problem with e=
nthusiast/studio USB audio interfaces and it happens to be a pet peeve of m=
ine.

I recently contributed a profile for the Behringer UMC204HD (https://github=
.com/alsa-project/alsa-ucm-conf/pull/128) and found the process to be a lit=
tle intimidating, but with a lot of help from Perexg I managed to get it wo=
rking. I would like to help other potential contributors out by explaining =
the process step by step.

I was considering posting the article to the Fedora Magazine (https://fedor=
amagazine.org/), since that's the distro I use. However, I wanted to check =
with you, the ALSA maintainers, first, because the intent of the article is=
 to encourage readers to contribute UCM configurations for their own cards,=
 and I thought perhaps a potential surge of contributions is not something =
you want at the moment.

Let me know what you think -- is this a welcome idea or should I forget it?=
 I have a draft of the article available here: https://gist.github.com/brnd=
d/ccec98a575f7c0422d50402937439227

Thanks,
Peter Wedder
