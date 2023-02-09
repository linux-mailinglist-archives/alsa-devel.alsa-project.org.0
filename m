Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2644A6909A0
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 14:14:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05C1DAE8;
	Thu,  9 Feb 2023 14:14:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05C1DAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675948492;
	bh=L8RcKCFk8Mj/l/HKCH2VEWTFuEsf8QrJl/0+AMadI5g=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uxUVyLKXtuCeaGB2VSPOBShtEd4VKMP6ih86HoRCQO/u7BiSJzr7XCkbGfHeV3CeI
	 5BQnhemCf8fJIJFNuHQyYx5U5pUbXlwnN2vOV4hEroC6I8R/Io9CZ/nAybTipdVUaq
	 9RjEMWdOZh6U3LUvQ4R+gfUXg4hSH4CsKEXp+BpI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69039F80269;
	Thu,  9 Feb 2023 14:14:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D00FF80269; Thu,  9 Feb 2023 14:13:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BF77F80086
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 14:13:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BF77F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VW9IWKgX
Received: by mail-wm1-x32f.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso3829002wms.5
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 05:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q6UehWyei7/9LT/zdDWEG+kb3SxxswNdb+BNIsHrBAY=;
        b=VW9IWKgXOJnS+fkXvo9z0KGmuha7WJOSwQ5kZZ0QI0BqPLeuiICgn7wjLuG4whN+sW
         /lSY8t8zDdRmNwLkNr254fhbukvO/uaQ70AqO7E8wqmhcRhPm977LNzV304MMRZmIGA5
         y4L32I5hmUkeXYBssuS/DnansqmqeIecDggBbXlsarYB/EC0FVCZp/SZhVRr5MwfGXu/
         NTQqtG/5sIoXaDYOsbY5kQB/1IJWEhrYpLpsLaoTKJs0KCMiMtHKdyMlYl0eD7bYgkne
         /8P8/nbpwS7otH1W9SDFQiqYIWTszqXQu9QWE7zSkqPKSxCY1RDdlgKnr6LMkJtgNbDp
         PO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q6UehWyei7/9LT/zdDWEG+kb3SxxswNdb+BNIsHrBAY=;
        b=Yf/k+Ibnd1r9l9ZrY3U8X/e7JLh+OSKmkI84syyzQjX70WPpepeErFv1Ts/sM8soRQ
         QieHknuWbI9XJkvOIRsLctPZ9T6eqVAyRe993AcJujukJ75wEwmU5j0r54NuwdcTpzFi
         WSKXUb06Z3xVAcljOj6cJRSNBNHtIQqVgnrlmzjcFZxv0kRiWuKIDojGIDO8NLiUds23
         t/CCCb8rGYm/AzeLIhuYSpifDK4Mm/U8dwYw1uIhleu+R5Ts7VFqwy5A6lFsoNXTudrt
         Q8wc8cZgody5BK56jeeswpz2sdx6iq5tx01eLTkyRuORXBNyz5FPw5WjKb1G9VS2qcrd
         vqFw==
X-Gm-Message-State: AO0yUKXQ8RCQw7SpJxRRcj7eIanwI0KXklXiFvfDiXa2lZ80Ypo074G0
	TZs7C5QidTQN1Q0DqpRIQ1QiTA==
X-Google-Smtp-Source: 
 AK7set8qUqtAQ280xAnflz7cGJ/UCFJKJcGzVQxHQki5DgEpE8Huz8lXehp0eWuK/9fmEwqsotr98Q==
X-Received: by 2002:a05:600c:5108:b0:3dc:58d5:3a80 with SMTP id
 o8-20020a05600c510800b003dc58d53a80mr4250290wms.24.1675948427081;
        Thu, 09 Feb 2023 05:13:47 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ja13-20020a05600c556d00b003dc4b4dea31sm1789394wmb.27.2023.02.09.05.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 05:13:46 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH 0/5] soundwire: qcom: stablity fixes
Date: Thu,  9 Feb 2023 13:13:31 +0000
Message-Id: <20230209131336.18252-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YYJ2N4XTZCRMVY6UQCQIX2S5VYXG3N2U
X-Message-ID-Hash: YYJ2N4XTZCRMVY6UQCQIX2S5VYXG3N2U
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, steev@kali.org,
 johan+linaro@kernel.org, quic_bjorande@quicinc.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YYJ2N4XTZCRMVY6UQCQIX2S5VYXG3N2U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

During x13s audio testing we hit few corner cases due to issues
in codec drivers and some obvious code bugs.

Here are the fixes for those issues, mostly the issues are around
devices loosing the sync in between runtime pm suspend resume path.

With codec fixes along with these fixes, audio on x13s is pretty stable.

Thanks,
Srini

Srinivas Kandagatla (5):
  soundwire: qcom: update status correctly with mask
  soundwire: qcom: enable runtime pm before controller is registered
  soundwire: qcom: wait for fifo to be empty before suspend
  soundwire: qcom: add software workaround for bus clash interrupt
    assertion
  soundwire: qcom: set clk stop need reset flag at runtime

 drivers/soundwire/qcom.c | 111 +++++++++++++++++++++++++--------------
 1 file changed, 73 insertions(+), 38 deletions(-)

-- 
2.21.0

