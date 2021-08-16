Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 242333ECE17
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 07:35:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 871F31746;
	Mon, 16 Aug 2021 07:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 871F31746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629092141;
	bh=TY6XfTrSr7L43m8v6gBpGd6nNZY6PU5t1W9naWC1+Io=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ngd0nmSxQrUkPc3+zRyJnWV/kow0OUDs3ZHSZvhzM7+l94hdVX8/SdW1JSGqHQYe6
	 rh1ZOr+KwlW5BCu9RxB+beq/9JMUKYvUjlaKpt1v8HQwG6VvQTRB9H2oimpcAQf6od
	 lxmHntkd00MWR2rXc1ZbIs6gbeqf06V/hA3Pz8Ek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33446F80249;
	Mon, 16 Aug 2021 07:25:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8056F80249; Mon, 16 Aug 2021 07:25:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp11.smtpout.orange.fr
 [80.12.242.133])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83746F80134
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 07:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83746F80134
Received: from pop-os.home ([90.126.253.178]) by mwinf5d03 with ME
 id i5R22500B3riaq2035R2Vr; Mon, 16 Aug 2021 07:25:04 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 16 Aug 2021 07:25:04 +0200
X-ME-IP: 90.126.253.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: srinivas.kandagatla@linaro.org, bgoswami@codeaurora.org,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 vkoul@kernel.org
Subject: [PATCH 0/3] ASoC: wcd9335: Firx some resources leak in the probe and
 remove function
Date: Mon, 16 Aug 2021 07:25:01 +0200
Message-Id: <cover.1629091028.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

The first 2 patches are sraightforward and look logical to me.

However, the 3rd one in purely speculative. It is based on the fact that a
comment states that we enable some irqs on some slave ports. That said, it writes
0xFF in some registers.

So, I guess that we should disable these irqs when the driver is removed. That
said, writing 0x00 at the same place looks logical to me.

This cis untested and NOT based on any documentation. Just a blind fix.
Review with care.
You'll be warned :)


Christophe JAILLET (3):
  ASoC: wcd9335: Fix a double irq free in the remove function
  ASoC: wcd9335: Fix a memory leak in the error handling path of the
    probe function
  ASoC: wcd9335: Disable irq on slave ports in the remove function

 sound/soc/codecs/wcd9335.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

-- 
2.30.2

