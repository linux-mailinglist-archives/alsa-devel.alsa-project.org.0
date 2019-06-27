Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8955258251
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 14:15:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9E1B1670;
	Thu, 27 Jun 2019 14:15:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9E1B1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561637751;
	bh=Ds02k77d9ZIiGEcqo+9rQFCM0qfPE+JVQZ0EHqbV+NE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ndGSKt0mhjKT4VXmadbSKB/b+Z6+SO+M8t81w4yt3D5AMIRjsuTB5GgbXGgU7rrSe
	 OKjZzYuZ2PxofjaxbdnO2kBU9FUZDzd2cyQPnruo1VMw/Tpu37oJ9JsXPP9P8KrW53
	 wSUOSaFZ6SHzCx/zQn92oID6GhlXtM5nQBS2nwMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B0D2F896FC;
	Thu, 27 Jun 2019 14:14:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98F4CF896FC; Thu, 27 Jun 2019 14:14:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6428DF89678
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 14:13:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6428DF89678
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="XdfbE24d"
Received: by mail-wm1-x344.google.com with SMTP id x15so5505152wmj.3
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 05:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LdXcbqi//1yQdo7sH21GuoXxU61NLp73gRkdlfRljFs=;
 b=XdfbE24dBpd/sTmZ7q4zvtKudeNA2u1ZlCAXEV6LSSX9MhXFeHsJA89RAGLWnAXKz5
 SVrwt61pY7t/JEyrDiZRvdMmw8qKctFALBIdVUuWRHU/WnvcCMDN0IK8U+OnimL7puwF
 Slbnn8jecmWciwC7EuS8Tpk8VdmPuwZClsYozfuX6VZCVQoOeDpzVlchZJU26FXwdfy5
 pORUGm/YZEaHE/qjgWXlN/Ue67kPhK9qdJhmrEEL3hxk4wJJEcoOXRqO7ZG4kfkJ6OeQ
 UAG56yvB+/TjPpdUMEllkNehJ0aDgHDSIXuvklQkgtlY3BaehtSzHPujwV7ITEOl4np3
 uOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LdXcbqi//1yQdo7sH21GuoXxU61NLp73gRkdlfRljFs=;
 b=VhtDAWQhWQFE+BKudHhPLqfo8FUmlYSfQMHtaZCStRemGSYn4jzAOBlotizDdfMkEP
 qM2YPJQBQxzY33kS32sesJTNFsr1z4nXmbQ3aWchmQeLA7PYZUGIJasD0oHnjEhIXbCw
 rtJiVK6S5IKa8w9nKhxiUEfBRHmafGjQvgbS0LNmyYzGLcVn0fgglS6poEFIM10YEpFK
 6F4lTzQoEj/ew/lrA31MTMFCKxVMfGhciClM49pcxP/UfEfCCASbplixhV5kjKLsR5VX
 jeK8ypmVtpmrzbCZhvZWrM93xuai7QwP3jQlDlQCSY+V42FAz05MaBWWksn+XjPur3Lv
 7lMg==
X-Gm-Message-State: APjAAAV2AeVnBRICtod/1NHuPN+fFKI1J/2OOko9a/rraGkYPIC5scJ8
 kFjrzMGR79zqaR/ZkOYDMRjV9Q==
X-Google-Smtp-Source: APXvYqxfToTeP7Z6wbZ2zjURbfpnhMu6weuA67216EZ1Md0Y5D3hlgGZi/3X8aMdt1KW9lO/15lYrg==
X-Received: by 2002:a1c:9ac9:: with SMTP id c192mr3273937wme.0.1561637639202; 
 Thu, 27 Jun 2019 05:13:59 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id i11sm6160594wmi.33.2019.06.27.05.13.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 05:13:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Thu, 27 Jun 2019 14:13:48 +0200
Message-Id: <20190627121350.21027-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH v2 0/2] ASoC: soc-core: update dai_link init
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

My initial goal with this patchset was to allow a dai_link to have no
no platform component, instead of having dummy by default.

However, when rebasing, I discovered that Kuninori Morimoto had recently
done that in a different way :)

I am still submitting my change since it should allow multiple platform
components on a dai_link, which is one of the FIXME note in soc-core.

I have also added a check on the codecs component availability to align
on what was done for platforms and cpus

Change since v1 [0]:
* Fix registartion typo
* Rename dlc variable to codec/platform

[0]: https://lkml.kernel.org/r/20190626133617.25959-1-jbrunet@baylibre.com

Jerome Brunet (2):
  ASoC: soc-core: defer card registration if codec component is missing
  ASoC: soc-core: support dai_link with platforms_num != 1

 include/sound/soc.h  |  6 ++++
 sound/soc/soc-core.c | 67 +++++++++++++++++++++-----------------------
 2 files changed, 38 insertions(+), 35 deletions(-)

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
