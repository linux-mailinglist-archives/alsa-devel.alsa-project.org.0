Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D113A5C7C
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 07:34:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 987151788;
	Mon, 14 Jun 2021 07:33:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 987151788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623648869;
	bh=hJOH7i08RJZq++lx78fKeQ7f2tG5dA9BqhiaAdIWqkU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=twUeEsNaFHe24xDtfDkyAsFp0NcvrdliV4+pA5Pctxc2BSWihjLJ/AELFcoeeAlfm
	 TXHE3OhGgztGeVTHsPyFhRiVwODMRaSAvJ+xBrFNkfWDtQhfvZv2Yb0v/QEseFsZVi
	 fzzRgcXQH/HcnnNjC+Spi26ZjdJpmDkn3AmkvmSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11791F8021C;
	Mon, 14 Jun 2021 07:33:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6723F8023C; Mon, 14 Jun 2021 07:32:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,MIME_HTML_ONLY,PRX_BODY_29,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFCB9F800DD
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 07:32:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFCB9F800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="honPp0Wt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623648773;
 bh=ss5WYFVhFb/f0ONlUtQHlnWXOT5gknO+6qMUu8Mxazg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=honPp0WtCooZ2szfUF5KOXmDfBJfD7rkEmOE4Jalr+0Kw2pAOT6qzpFH1Htm5kysm
 evti0eiCcsCa1GIRLNxVEJB8JHvB+9De3LcgF8809Cb8hU5/sYI3ttHy1HqQmoqXJt
 iZKvG3h9OzLcdhNKm9OCzl6UcpB9K+jj2kNXawbE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [93.194.223.136] ([93.194.223.136]) by web-mail.gmx.net
 (3c-app-gmx-bs57.server.lan [172.19.170.141]) (via HTTP); Mon, 14 Jun 2021
 07:32:53 +0200
Message-ID: <trinity-60583881-3802-43ab-8ebb-6172dc0508fe-1623648773558@3c-app-gmx-bs57>
From: Roman Muller <klangrausch@wolke7.net>
To: alsa-devel@alsa-project.org
Subject: Xone43C: USB communication
Date: Mon, 14 Jun 2021 07:32:53 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:DoJCtj7HQA8w7G0YQ72PGBXTGiocTb66AV7T4ZaN78v6OsOAtQYr0DrPXHFY/sy2J+Ywp
 SQvQ8bLsd1JOHSrq0USxSO4Ben3WJvs99rBFKnLA94cHe7J2wRU2IfrKIGWiUFLkiiwZo8liLbFo
 cuJcSk0APlpKexTp1Hz8GLH0+MzcgkOlyX+Rm8Y06pioNzcMPVgSiTmUuuSi1hL6reAJHjk/mP9H
 khtXtDeck13xyDbSsrwEkrCzs82G/P8oZ1lZRs27m++1jBQuHrgovsiZ9c+aSzAc7MHl1frI1dK5
 8k=
X-UI-Out-Filterresults: notjunk:1;V03:K0:A4jgPYFlC2s=:X5329nBii874x2Z7ggh+2S
 JsdXaqpJ9g3+L3aFogS5vUBoQgrwV+EaGjcJXxLMR1xkR7cOptJ1N2kAE72uoeJHB3Fc5ie+Y
 2PgFhcFbcx+Sa7ia/iXpOFL5Q5v7kqLOAz0uUrlEwZBP1in1XF7PZXHPr4+EPJRhYHL1zVXfQ
 fGITnBEyxsaw4Wm4v0xhYL8R/kxWipBYfY34geOgHx1ow5BNSTq0W0+/Y4tc+bMwpX73b4DK7
 1+RxMDXwmEdEgGNquJGPf1ve+JGaXExm9EttoCG1uL8JAW0utI9lFIVDif6vB4E7KoVhXoG3Z
 ur8Kj6F4ZDKl4MjQXkzTr33U/i/YGYcRqdPE43tkdzLxHS/+f7ZDT15Tej7wNvDZIf7ExdsDI
 GSbfwT77AeBiFQu+YEA71DTwu6zeC52nUWwH2rUyl090cG482Tv8BYP/gr57HWB5xpbdE7ZfZ
 xT/8rF+JbM5m+IAZHwV1n8DKSJUKzzLdsomVrEq4oX71aqMtLlgkqKRD6tlsvj8gvl0gcCLwJ
 Pln6aJhTP881MXA0t5fAIIvwA7gImAPTKQLVHhnRM35yHjU00k2L+pw/Xk/MJJz00caIR3B+U
 c/eDl/g8nBFnRTSJJUYl1x+IIH4ZtFqy9YGwRihSa4JYK0TCrLAgIEXkpGUc80N/CyjLz+Pqz
 TQP/aIocF/0/Sb2R/TMY/hsuhcKxtuyGo4VCPaLzfpwe7W4TFqh3h+uVW6A/gb2IeC1ZRPEfH
 c/KZsd46WxrECi6/V07OdzkO3T3jQ0Haolehyw2/2Ku1hDO4ZSXkfT0Qn6habH0to9Br9XenY
 nx9mZopc8OrDbese7L8s3FsiRp2il46wYlREKicIwjrQGVE2Os=
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Geraldo Nascimento <geraldogabriel@gmail.com>
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

   Hello Gerardo, hello all of you,

   > Is your capture complete from a software standpoint? i.e. are you
   > starting Serato or Traktor on the VM while doing the usbmon capture?

   Not tested yet, I need to get a few items for that and investigate the
   matter! It is complete up to loading the Win10 driver (which has been
   supplied by the manufacturer). Maybe I am lucky and
   this is already sufficient.

   Have a nice day,
   Roman
