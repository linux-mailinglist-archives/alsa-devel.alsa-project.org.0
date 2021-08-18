Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D51CD3F0767
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 17:04:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7217F168E;
	Wed, 18 Aug 2021 17:04:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7217F168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629299098;
	bh=Xsxo8Kz/lcGnLgmkM4mb4sNPwp54wdv/+FE4iHaOw5M=;
	h=From:Subject:Date:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DGOxxl9IZUoud0ghhwrAuUMUMGBi+czCfa6JtJdo0/pCtKODX56JE8r+489eWF2vB
	 mGe/jKOvlKlooTYjygm0wio23tiSqoW/3MdqyaocmNJ+42BuZjPg1WVCI+pN8PC3tO
	 QjFsUfnyWttoNE8N2Nr3IRFjtpsAH7poKTnrZ7/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2D03F80163;
	Wed, 18 Aug 2021 17:03:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64688F80249; Wed, 18 Aug 2021 17:03:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out002.mailprotect.be (out002.mailprotect.be [83.217.72.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D1EBF80163
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 17:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D1EBF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mailprotect.be header.i=@mailprotect.be
 header.b="vNZbcedx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mailprotect.be; s=mail; h=To:Date:Message-Id:Subject:Mime-Version:
 Content-Transfer-Encoding:Content-Type:From:reply-to:sender:cc:bcc:
 in-reply-to:references; bh=Xsxo8Kz/lcGnLgmkM4mb4sNPwp54wdv/+FE4iHaOw5M=; b=vN
 ZbcedxivBN5NNypQIo/obGpRTemrO87aMr0/fopmQW0zzWNfBeXEtvHgAkO0YJ1TNZFdqHdn+pHDZ
 n3OHzfbfR9Eaticc+XS9IXAL7BhbyS3NcLO9F+YhWlyLR4q9iE2acY15SJznvBe+63551lKTFM8Qd
 r0Bp1w+qE3gCgYzpJV9/Gh9OoivDmszXp6DK1JOk1gp2jOV6X+IaLUrpmfIXP/xUENZ7SeS+DnPQV
 +rE0d0wNjXpHK1/Pc3+MpYJ+93iOrSAryCIIyK98AA8Ml8GQq8NraIq6T5WuYnz8PjUQ8FpAF6uhl
 HaZqDib65DlhanaObQJxRm2B6X18BKtQ==;
Received: from smtp-auth.mailprotect.be ([178.208.39.159])
 by com-mpt-out002.mailprotect.be with esmtp (Exim 4.92)
 (envelope-from <linux@panokkel.be>) id 1mGN6C-000Aav-9Z
 for alsa-devel@alsa-project.org; Wed, 18 Aug 2021 17:03:29 +0200
Received: from [192.168.0.48] (188.144-179-91.adsl-dyn.isp.belgacom.be
 [91.179.144.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-auth.mailprotect.be (Postfix) with ESMTPSA id 3CB7AC032A
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 16:59:53 +0200 (CEST)
From: Philippe Bekaert <linux@panokkel.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: huge mixers
Message-Id: <D2E8FFA2-BF84-4C64-BC5A-2DCEC1C18BE8@panokkel.be>
Date: Wed, 18 Aug 2021 16:59:50 +0200
To: alsa-devel@alsa-project.org
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: 178.208.39.159
X-SpamExperts-Domain: mailprotect.be
X-SpamExperts-Username: 178.208.39.128/27
Authentication-Results: mailprotect.be;
 auth=pass smtp.auth=178.208.39.128/27@mailprotect.be
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.28)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9wYHivdLt9CsUDUK9RB13RPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wI8D5AnkcPR12/sl/nlqnGQ20HGDJnwk8BgzAUpYTUGKvp
 k7Vp2UXVHEQMIct0liIQibczVy72D5G7JmVzqVkSswKQDamPN66SYe4XX4xmgBmNBHh5pvNozdjh
 iHhZmV6hiiPox9Yu1atsOeRdW0omz0d+/hdeAZZOrheiaMELaayFgolxSvX8PPuD51I4GcLsysIQ
 h3c1tpyciYbqCvvg9yQ3U0m75sPR68f+76r/UU3FrKlNunbw3GCGM2ilT85qqPgohIhFInkx+MTw
 5q6dkTJhh/tOaUjeIRypcrgDreMTbkn6z1fsm8NoMVdUr8NEDBffVZVjmVaNbG4ZJG7FM3OWlbqb
 csN1fWzfTsVQAoN6N56pJMvEKGR0V7i2wfXZ4xpigOktCp6Xcz12tfjFPd0rEuGjFyZoidhtHm+W
 oYHDWe7An9kggCfary26bMTuyf/9FwsQjCZ/G16ONVA9Mfu+na9cnaseC7uWBNb5Bal1r07cmbef
 hNqx0U8Yjj0Cn996kLU2Kwz4sRK+A9mnrSOIPpeqwlm2NDGXIJ2x7Btys4Bduqo6Vkpv1EdPtIcq
 IchqIsr/BeYfJr8B2EAeMe0RDykjzFwSjWbueUABqsy12K6NcgFKBUVItiMogtN/2BGbGZwroD8O
 CK9fBGkEdo3wPTpUBDaYEBcVjrEqLREVniihuDwEGDcmr6e3OPQANmv9bAqoyVNiejMG/mgizAR0
 Gxu2j7JMIaz9VNJCBGg6xEF/kx+l1pk1/3Ggw3RrpRGEo14HBF5GhpTjsKdqctgzcDoFd+96Xw4Q
 UNtTnQQnl4ZfrBmTEyuPOO9TJNQyauIF/Czj1bDAz4LnbJZxYRZ6HzXgXBCnYQkKU3lKNedKEy7b
 P5gIt23U7fpAnNOOuCwjXCEFYFIPENBAw9BsACze+9Z5PqxOodVH2i+afXBEn95eECKi3gxjzXac
 2CKjkM6s+U6v8mROuTBeANUWBBQvOz+eHT/omN+7iKqigWKURvSolfd8/ql2ZSuoOkw=
X-Report-Abuse-To: spam@com-mpt-mgt001.mailprotect.be
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

Dear all,

I am working on a new driver for the RME HDSPe cards, which eventually =
could replace the hdspm driver.=20

These cards have a hardware mixer / matrox router, freely mixing tens of =
hardware inputs and software playbacks into tens of outputs (8192 mixer =
controls on the HDSPe MADI).

Right now, mixer state (cached by the driver) can be read efficiently in =
one ad-hoc ioctl call, and individual channels modified through a HWDEP =
ALSA control element with 3 parameters (input/playback index, output =
index, gain value).

I understand there is a desire to get rid of ad hoc ioctls and am =
therefore looking for a more generic way to read and write huge mixer =
state.=20

Has anyone been facing similar issues? How have you been solving it? Is =
there any =E2=80=9Ccommon practice=E2=80=9D or =E2=80=9Chabits=E2=80=9D =
in this community concerning this topic? Would it make sense to define a =
kind of generic huge mixer interface? Then, has anyone an idea or =
preference how it should look like?

Looking forward to your feedback.

Best regards and thanks in advance,

Philippe.


