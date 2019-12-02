Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7CB10EEC0
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2019 18:50:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E87031664;
	Mon,  2 Dec 2019 18:49:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E87031664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575309032;
	bh=6TvHwaOUiq2steXep3JyWNF5+MeNuSyPkBEBmtvkmeE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UCUr6zmgauoi8lWePVdt7Pa+wf4I6Y3iS6AJm5nNVSjPmfPzbiLmB9nSMjA/n0gej
	 7st/7AQhtnRG42I+bEp6wWVNq8VguBtm+q5Le0XcdSoHfFt4chABfhh4MMYVYJ/obT
	 RlZ6UE7UyvbFXbOBsjZtxS0Y+uceawRLLnu6rF2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CAC7F80216;
	Mon,  2 Dec 2019 18:48:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A26BBF80216; Mon,  2 Dec 2019 18:48:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from node.akkea.ca (node.akkea.ca [192.155.83.177])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA2E9F800B4
 for <alsa-devel@alsa-project.org>; Mon,  2 Dec 2019 18:48:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA2E9F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="Qa0+r9Xi"; 
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="Qa0+r9Xi"
Received: from localhost (localhost [127.0.0.1])
 by node.akkea.ca (Postfix) with ESMTP id D24274E200E;
 Mon,  2 Dec 2019 17:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1575308920; bh=qfKdNZ1HBtViTTD5XHaCa9z4hvXMR4eI/MrZct97QqY=;
 h=From:To:Cc:Subject:Date;
 b=Qa0+r9XiQhfbN0jBdjUEoNVNnhYSz41LKL/xNHwYfsxcZHN7V4F5B3vsUAacwh+ns
 nADerYPHg1nVDYeHK8NLSEVFX/H4TDgEtEYWQUpqXIxxQrCRxmwki0NlCRTVZvjzVy
 sOjekbkH75Cp9Ge7px6MdRYZg+ozDIJftgaFfPG8=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
 by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JuvcBJccax_v; Mon,  2 Dec 2019 17:48:40 +0000 (UTC)
Received: from thinkpad-tablet.cg.shawcable.net
 (S0106905851b613e9.cg.shawcable.net [70.77.244.40])
 by node.akkea.ca (Postfix) with ESMTPSA id 825844E2003;
 Mon,  2 Dec 2019 17:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1575308920; bh=qfKdNZ1HBtViTTD5XHaCa9z4hvXMR4eI/MrZct97QqY=;
 h=From:To:Cc:Subject:Date;
 b=Qa0+r9XiQhfbN0jBdjUEoNVNnhYSz41LKL/xNHwYfsxcZHN7V4F5B3vsUAacwh+ns
 nADerYPHg1nVDYeHK8NLSEVFX/H4TDgEtEYWQUpqXIxxQrCRxmwki0NlCRTVZvjzVy
 sOjekbkH75Cp9Ge7px6MdRYZg+ozDIJftgaFfPG8=
From: "Angus Ainslie (Purism)" <angus@akkea.ca>
To: kernel@puri.sm
Date: Mon,  2 Dec 2019 10:48:29 -0700
Message-Id: <20191202174831.13638-1-angus@akkea.ca>
X-Mailer: git-send-email 2.17.1
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Enrico Weigelt <info@metux.net>, Allison Randal <allison@lohutok.net>
Subject: [alsa-devel] [PATCH 0/2] Add the broadmobi BM818
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The broadmobi uses slightly different parameters from the option modems
so add the paramters and document them.

Angus Ainslie (Purism) (2):
  sound: codecs: gtm601: add Broadmobi bm818 sound profile
  ASoC: gtm601: add the broadmobi interface

 .../devicetree/bindings/sound/gtm601.txt      | 10 +++++--
 sound/soc/codecs/gtm601.c                     | 29 +++++++++++++++++--
 2 files changed, 35 insertions(+), 4 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
