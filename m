Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C143C3F07F6
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 17:19:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64AA8169F;
	Wed, 18 Aug 2021 17:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64AA8169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629299982;
	bh=iQgIItythd5DysvM/wzoV1WOmmN9QTgYHB+roZgovJI=;
	h=From:Subject:Date:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TqcjyI6D6baFjtcGjP4fL0kqImuxtdJarphYeXnvtzOMfJ7/97FHT9ZvFX4iBlrYV
	 B9Dd63PeSmKdX7QcJunB9el8Au1xDJOIkEAAOufB19Y94WB1fujegM50MWdl+14IlU
	 Z2aW2tSBw3A3A+olRPe5iX+RbyBYSA1j52phLLxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B23B2F804E3;
	Wed, 18 Aug 2021 17:18:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3E0BF804E2; Wed, 18 Aug 2021 17:18:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from com-out001.mailprotect.be (com-out001.mailprotect.be
 [83.217.72.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F450F804DA
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 17:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F450F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mailprotect.be header.i=@mailprotect.be
 header.b="jY5xNxOh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mailprotect.be; s=mail; h=To:Date:Message-Id:Subject:Mime-Version:
 Content-Transfer-Encoding:Content-Type:From:reply-to:sender:cc:bcc:
 in-reply-to:references; bh=iQgIItythd5DysvM/wzoV1WOmmN9QTgYHB+roZgovJI=; b=jY
 5xNxOhoAxmlV4DneVbX5+Jw7gINOelJZMnTkjZkWk9p5TitqPwcvZWnOTFGqVES/Wd+qUMMmcsmhD
 NghlHJSlO+ORmOspFnaXGhYFDKsyYIM90mfB+05wPhLbJ5mjHr3owvSo2FxCjkElpaNe3oHI5yhO6
 uY3vc0cVIoQnq6JLIQ2B40VAMMqzk2X5Xydlolzhr0yFS9ZFwHDIbNhh0dUJTgvJXgmrHS9MTjSg6
 9ZxBZVVGEUvUxKW233X0rDGvzsfScbwa9mxzQCrVfbRhU9q2qpGokIXZ5+0nrcd7JQpvQisuZyvfJ
 au/pw7vcWZxkz4louVMKZ3bFFY8pTiuQ==;
Received: from smtp-auth.mailprotect.be ([178.208.39.159])
 by com-mpt-out001.mailprotect.be with esmtp (Exim 4.92)
 (envelope-from <linux@panokkel.be>) id 1mGNKb-000Bzh-BB
 for alsa-devel@alsa-project.org; Wed, 18 Aug 2021 17:18:17 +0200
Received: from [192.168.0.48] (188.144-179-91.adsl-dyn.isp.belgacom.be
 [91.179.144.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-auth.mailprotect.be (Postfix) with ESMTPSA id 2208BC040F
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 17:16:27 +0200 (CEST)
From: Philippe Bekaert <linux@panokkel.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: PCM channel names
Message-Id: <8FD26792-0CE4-4E46-B2A5-E3780FC3B15B@panokkel.be>
Date: Wed, 18 Aug 2021 17:16:24 +0200
To: alsa-devel@alsa-project.org
X-Mailer: Apple Mail (2.3273)
X-Originating-IP: 178.208.39.159
X-SpamExperts-Domain: mailprotect.be
X-SpamExperts-Username: 178.208.39.128/27
Authentication-Results: mailprotect.be;
 auth=pass smtp.auth=178.208.39.128/27@mailprotect.be
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.38)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/Q5H4Zvcmvl81aCYzOTZhePUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wI8D5AnkcPR12/sl/nlqnGQ20HGDJnwk8BgzAUpYTUGKvp
 k7Vp2UXVHEQMIct0liJdJW9puLtvUuoag78dzBFnswKQDamPN66SYe4XX4xmgBmNBHh5pvNozdjh
 iHhZmV6hiiPox9Yu1atsOeRdW0omz0d+/hdeAZZOrheiaMELaayFgolxSvX8PPuD51I4GcLonZtA
 vX1WzENHOSMGSyH29yQ3U0m75sPR68f+76r/Ud8cjIN3reG9z0FKKQ5m2Qooa20mCX0fi2bWQ7rT
 SQDxs5srTnb+Mu57A5wjlqYzGz24rQe9+/XtclLOTVMRq9W72rVlokj9CcZZe4NWxmYtUTBsIV2x
 qb9+rE9eAlaoqpphCjLoM3OhjV6kvTjjyvBdjx85xQq9VD42UbTRudBo31/E3ahF5MMcDI7KdpjQ
 Kb7VhVlAbuQohUsoMB8/9+IvP92yJqFDUMWgYkYfhC80Gwm1A8pCIdnIW9QdjDt5I4lSPGIn6LIh
 6vfZt6Tuc+uVfVL7ygxIxIEhQBgsu7ia6J1fhOzjF0b4LXcjJZ5loorRYn0ZvHpcLl/OavUi/RGk
 3lS1t6QdEPz08qMKOQH7sIbE4UiyqJdelX29TgsXf5+ZnvDDYbgvmGdEE1VWx8J8rh7h1s6DSh98
 40yDjMKs5/gE7OC0au1m7aV/2lYNTueURvP7468+f+EGtWkSZL0nBy/PpUxgSFRPcWxJF+/bGKab
 80xeVn/GOpnd9ZL3zxrHbsy2AzqLkuSV7xq9g7gUSunMfqfSQSJ4CoLIQdUnIbtf63VNbf0lrvss
 Y+k7AOMp68n5Mxe8trh3A6NtxGO8IkwAXSHU/VLEuRIRyzml0jXsax3qUOPIpGgqdLeqBjA0XAoG
 ECHs14pjPDDBgak9LF0rECLmIIcFbKgxie4a09PDcKZtfuSpOwk1tGwWvHPw17RyTo/iK8p1aZEn
 H6DUdQkQGCPtwXjXyPZWpNzWSy/3tDea9a84QNt8xrcOgd7mq705+GIFeYFzkUqu2/Y=
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

Same context as my previous mail =E2=80=A6

The RME HDSPe cards have a large number of input and outputs for which =
the standard ALSA channels names and mappings make little sense.=20

Names depend on the card, e.g. Analog.L, Analog.R, AES.1/1 =E2=80=A6 =
AES.1/8, ADAT.1 =E2=80=A6 ADAT.8 etc=E2=80=A6

Right now, the hdspm driver provides a ad-hoc virtual file in =
/proc/asound/card<n> containing these names.=20

Isn=E2=80=99t there a more generic interface to communicate PCM channel =
names from driver to user space

Same questions as before:

Has anyone been facing similar issues? How have you been solving it? Is =
there any =E2=80=9Ccommon practice=E2=80=9D or =E2=80=9Chabits=E2=80=9D =
in this community concerning this topic? Would it make sense to define a =
kind of generic interface for PCM naming? Then, has anyone an idea or =
preference how it should look like?

Again looking forward to your feedback.

Best regards and thanks in advance,

Philippe.

