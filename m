Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E661B5ABC
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 13:48:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A32961699;
	Thu, 23 Apr 2020 13:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A32961699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587642533;
	bh=0BLL27iEGk/+Mi2bH8/U6NRmtaOk9kbk5ToQbXDW9t8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QitnTh7BK119y2kIdlTAV2XjH1wp9dU803rd+SciX6XBm4tZX7oJQmBfkhoULMhJJ
	 c9wWQqt2GHMQuUnp5+Hhbxyu/SW/ikp54Gtz9s68CslvcQhstugLyyAMugawicRHsJ
	 azwQqg/uDkTJ9iyAWvNLKrBlte3/BH2ksVtkli0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6606F800F2;
	Thu, 23 Apr 2020 13:47:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30CF8F801EC; Thu, 23 Apr 2020 13:47:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65D86F80121
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 13:47:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65D86F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a3PfEnDj"
Received: by mail-wr1-x442.google.com with SMTP id s10so6503434wrr.0
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 04:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0BLL27iEGk/+Mi2bH8/U6NRmtaOk9kbk5ToQbXDW9t8=;
 b=a3PfEnDjL3KIAJQTn+uRK1bsglqN+kJbnk9JcJqkldMCO1kJ/tRZFxgVQ7MT/phGmi
 ddYZoyq5xIeEWqHxDOl+WZ8QP4EtsGdZk7fEL43zOS+Be9E1uE8Bh3AcpIAt86h84h4Z
 gHk7Eeo/H+R9r6i8c6ZCvyuYJ/69ocPWkMzxMA0aTqQ281Qdadq56CFlqZ3PsgqlOssn
 uE913nSAEOSUtUO3M32A9Z6B4qb7z3g2UY0/3rvrra6VaPBSrUX69t9lgVVj1oG9w0OM
 lsQYoMiWOqrJ/gBf6brwTGqXkiulHMe75l1NSENdP4MRw3tz/u57+kCk9bLrLioifDW3
 nKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0BLL27iEGk/+Mi2bH8/U6NRmtaOk9kbk5ToQbXDW9t8=;
 b=diFbXWOQ3HKdjKT3W03b+XmkeMHBraJBFhD27XErA6BzgOu8EtN4GFcgj+9IwqgVr/
 jjsFf0PvPTPcAtXywCPf7CMyG8n/LieU51TmH8bcSw7eskekeuJMmftv3qQ2/FdCPhC5
 5HDg6PTfv7R8vZTPqtx1jM/QuecRtp6X7pe4okxePoeX31xIsXsgP9f+2ORpQCcSr8EN
 YP8OnoxEcuPqs2UniCPdRtefTIt25WfGynf8SMxXjxNz7mr4RqABnkrb79erIuy+U67t
 q5vgL8Lya5oxEs8SVZ2z5K0/enuIgZZNe4V5CCxyUnMYHbyvaeuhcjIJ9fVoNJUa9wNY
 8tyA==
X-Gm-Message-State: AGi0PuYUojuI0GZ9JiOYYlAs9+MgoWcF85TaJAqchI9Nftx3yXFoWQve
 CNFQtHEtUYqQ1IIcC+FhcMm0hpbMJ1Zsug==
X-Google-Smtp-Source: APiQypKOR5AIJXcpAgkP6deo0/aJKdNAdd46/6jdzUxk+K+MuC4x46nEtk6E/ljR8eaycPvSV9glig==
X-Received: by 2002:a5d:42c7:: with SMTP id t7mr4457485wrr.336.1587642424585; 
 Thu, 23 Apr 2020 04:47:04 -0700 (PDT)
Received: from localhost.localdomain ([91.221.170.230])
 by smtp.googlemail.com with ESMTPSA id s9sm3622805wrg.27.2020.04.23.04.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 04:47:04 -0700 (PDT)
From: Gregor Pintar <grpintar@gmail.com>
To: alexander@tsoy.me
Subject: Re: [PATCH] ALSA: usb-audio: Apply async workaround for Scarlett 2i4
 2nd gen
Date: Thu, 23 Apr 2020 13:46:56 +0200
Message-Id: <20200423114656.2803-1-grpintar@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <c0cb78664e3acd94f07e59f3a4216c16ab9f497d.camel@tsoy.me>
References: <c0cb78664e3acd94f07e59f3a4216c16ab9f497d.camel@tsoy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Gregor Pintar <grpintar@gmail.com>,
 alsa-devel@alsa-project.org
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

On Thu, 23 Apr 2020 Alexander Tsoy wrote:
> OK, here is a quick hacky patch, that seems to work for me:

Great, it seems to work for me too (no click recorded in one hour).
Sennheiser CS60 (adaptive) also still works.

