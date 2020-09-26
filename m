Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA2A279B1B
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Sep 2020 19:03:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4BE21A3B;
	Sat, 26 Sep 2020 19:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4BE21A3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601139816;
	bh=9s2HDmkqgX2xCxEWWolfIABnCA5izq/PtyhsRM/U+yA=;
	h=From:Date:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XCkt+Mu5oFtEVOtI3OpzeVSpaAFP8AypZrV3Z45+se9RvHiMMumy9coyMJUm/jqJn
	 ycDblaXm2hGTDvkFc2T4yzUWt4PYY9W9mNjG33jUzKbvfYNVUBQo3REMhWLgzrd4qo
	 MD9YrKAaFHxRCJ9oQIxbJNfTfGEv7k4KBOqRVxys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7881F80232;
	Sat, 26 Sep 2020 19:01:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 526F1F80232; Sat, 26 Sep 2020 19:01:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB9A5F8010E
 for <alsa-devel@alsa-project.org>; Sat, 26 Sep 2020 19:01:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB9A5F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oTYsBQ2l"
Received: by mail-ej1-x633.google.com with SMTP id p9so2776906ejf.6
 for <alsa-devel@alsa-project.org>; Sat, 26 Sep 2020 10:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:user-agent:mime-version;
 bh=Jt8GccEnjq1iGwDCAIard4XMHgfmZQ7MJ7ku4c4id5Q=;
 b=oTYsBQ2lajSe8mxBNlatgPAwZgxPzkDW/f1s9lSDbl8Rf/UMktz1W0ygjeB5S4NTM2
 S2p4j2Dt9tV0BXzu/MQzAlW9+nBKnUV4dz63rrxJUUkZywoLFY2LDmbQwHnKFaMgW0f+
 LIfX9wBTX0eiMIZgp9syKPU9YZvmuiP88C+xleDm4btd4iFX9qZrUYJ0iC0sY/94jS9A
 oVtXre2b4bmlLH+i9dlvCTj20hMA6XY+UkWCOm62OS66Lq6Bglx5TD5K0Ji/KplfC2z2
 xDmI/hgWPa0gfoNAaHGk2jRXi94O9KICYm1pEFe5vTdhNqF/iNVgYjx0fAh7mFQhWvuu
 MNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=Jt8GccEnjq1iGwDCAIard4XMHgfmZQ7MJ7ku4c4id5Q=;
 b=JQDQTNV5Sx6hpfwn3w5tSWfFGjmDEhIL1FFTdEJw8C7idfMfdxPGsvjoykkAXq0GRi
 1AXpSw6IidmqfzquvjiaJkSJgZHACPaGtO+qNsSl/dWJuVMktUhJmyOb1GzpSU1HjVXN
 j8+5aNFY9J/4sqYP7mVrj1nwlOco8ZTiioEJ0pf25wboWyNDzwTHODzwfrjHsOc/N+js
 7WgxlPtUN0WQ1CgOIQpHgRDP7IP1vMuMRXNmZUdoml2VoietpB6JLFAzn+My7bVxXKQL
 F4XKa4xNFTXU7ZnrcHgiV1S+y+D6EG8Gq/O+I7VXq/h57Nly8SJte92dVSK4kVXArngh
 pf5g==
X-Gm-Message-State: AOAM532SZbAXtYxX5AkycyRfSQ242jnDWEtDBVJcY34itmHuUJDwbowH
 MJYKaC+DeUT3+SVbkFEYfpaE/ScHuIPGfw==
X-Google-Smtp-Source: ABdhPJyvnq26+Osyszon1/5y4kE4IL1r1Jx8cTPZL0t2ZczE/RIGdAomLjAXX1/ER4U6SAbeZ90GJw==
X-Received: by 2002:a17:906:249b:: with SMTP id
 e27mr8031434ejb.105.1601139700052; 
 Sat, 26 Sep 2020 10:01:40 -0700 (PDT)
Received: from felia ([2001:16b8:2daa:2000:7547:ca13:c101:33d2])
 by smtp.gmail.com with ESMTPSA id a26sm4383926ejk.66.2020.09.26.10.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 10:01:39 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 26 Sep 2020 19:01:32 +0200 (CEST)
X-X-Sender: lukas@felia
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: License clarification of sound/soc/qcom/qdsp6/q6afe-clocks.c
Message-ID: <alpine.DEB.2.21.2009261855280.31589@felia>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-spdx@vger.kernel.org
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

Dear Srinivas,

with commit 520a1c396d19 ("ASoC: q6afe-clocks: add q6afe clock 
controller"), you have added the file sound/soc/qcom/qdsp6/q6afe-clocks.c 
with the SPDX-License-Identifier: GPL-1.0.

The use of 'GPL-1.0 only' is strongly not recommended as the Usage-Guide 
in ./LICENSES/deprecated/GPL-1.0 points out:

  The GNU General Public License (GPL) version 1 should not be used in new
  code. For existing kernel code the 'or any later version' option is
  required to be compatible with the general license of the project: GPLv2.

At the end of the file, you further state it licensed with GPL-2.0 with 
the following line:

MODULE_LICENSE("GPL v2");

So, is this just a typo in the SPDX-License-Identifier or do you really 
intend to license this file under GPL-1.0 only?


Best regards,

Lukas
