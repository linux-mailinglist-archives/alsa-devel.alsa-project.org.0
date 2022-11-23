Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C76716360EA
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 15:02:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D5A51664;
	Wed, 23 Nov 2022 15:01:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D5A51664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669212125;
	bh=yhzurhIFjkG8YiOqot0aJrg2GxSUywFjMnU60abrfdw=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A5kiiKAu7tGauZ0WxEhx/lHoAx2YxNeZlA3AGsfaq1NdAyFDkgJYMe2dVj0xgWczy
	 IdYTubvwIha4QAO/hy72JyMEyv0G219pDnPxnGvZrTst8Pqxldguao0I93I4THaDng
	 ldKl1JeXY+Yzvs8Sg2jzb7FxVGF73YoOeExKWwLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF6BAF8030F;
	Wed, 23 Nov 2022 15:01:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E986F80115; Wed, 23 Nov 2022 15:01:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from forward503p.mail.yandex.net (forward503p.mail.yandex.net
 [77.88.28.113])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1585F80115
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 15:01:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1585F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ya.ru header.i=@ya.ru header.b="C3FdkEds"
Received: from sas8-e2d6e97d76c7.qloud-c.yandex.net
 (sas8-e2d6e97d76c7.qloud-c.yandex.net
 [IPv6:2a02:6b8:c1b:2904:0:640:e2d6:e97d])
 by forward503p.mail.yandex.net (Yandex) with ESMTP id A741F11018C3;
 Wed, 23 Nov 2022 17:01:03 +0300 (MSK)
Received: by sas8-e2d6e97d76c7.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id 21oel74dH0U1-jF7Dlbct; Wed, 23 Nov 2022 17:01:02 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail;
 t=1669212062; bh=yhzurhIFjkG8YiOqot0aJrg2GxSUywFjMnU60abrfdw=;
 h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
 b=C3FdkEdsbtLJW13vDiHU6Nn6JU2QxYWjbZ8exXo92itOFNX1RDjtfgW8QmpBy07LK
 58LQA7c2api+ZnqAx5RaMhQTBStZdwZlKQp+Rvd8f/nNBvZPnesH5LYFX6OXtrhJ8M
 E7yT7GaPjVoNR0KR8nsVLlttrrc+atanFyAZaJ9U=
Authentication-Results: sas8-e2d6e97d76c7.qloud-c.yandex.net;
 dkim=pass header.i=@ya.ru
Message-ID: <a1ce30ac35705ec6e674b4a146ee5dc3b3087388.camel@ya.ru>
Subject: Re: [PATCH] ASoC: amd: yc: Add Xiaomi Redmi Book Pro 14 2022 into
 DMI table
From: dukzcry@ya.ru
To: Mark Brown <broonie@kernel.org>
Date: Wed, 23 Nov 2022 17:01:02 +0300
In-Reply-To: <Y34UBNoHZ+W2IJHn@sirena.org.uk>
References: <20221123065820.55159-1-dukzcry@ya.ru>
 <Y34UBNoHZ+W2IJHn@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
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

=D0=92 =D0=A1=D1=80, 23/11/2022 =D0=B2 12:37 +0000, Mark Brown =D0=BF=D0=B8=
=D1=88=D0=B5=D1=82:
> On Wed, Nov 23, 2022 at 09:58:20AM +0300, Artem Lukyanov wrote:
> > This model requires an additional detection quirk to enable the
> > internal microphone - BIOS doesn't seem to support AcpDmicConnected
> > (nothing in acpidump output).
>=20
> This doesn't apply against current code, please check and resend.

Strange, applies locally against
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-
next
