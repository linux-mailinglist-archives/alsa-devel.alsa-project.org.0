Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8077F66A261
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 19:51:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08B33991F;
	Fri, 13 Jan 2023 19:50:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08B33991F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673635907;
	bh=P7cwVKbEWWKHccIyhsAfBwdKdNDPM4OR/Ix/LXnBGF8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bomxIdYPNgzVvy97KaiESFV/+JWXuhzh6UsVs8Y1JQQdftSrdqNOcHBI+p9vg+SPT
	 Q9b9HqzVIGCfPmsNK8ujObEPL0aH9nCXKfJczZTNcr96sC6GniUfvfQxpPmyZptdwl
	 1I3qWONWxTMW+9F73M26eMF9lx930ABgMJV/Be4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E975F8019B;
	Fri, 13 Jan 2023 19:50:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 065B3F803DC; Fri, 13 Jan 2023 19:50:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41A4BF8019B
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 19:50:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A4BF8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=DE5+Uj6q
Received: by mail-pj1-x1029.google.com with SMTP id
 u1-20020a17090a450100b0022936a63a21so1396374pjg.4
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 10:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5hL77yfrLKfTCKAlEtnBVweGId1RZY6S2a2PQXwqLg4=;
 b=DE5+Uj6qz9KIyxJTSGW7A2/OFASzQB6BmyyomaA9RXUv66NrKiLF3qEVjWmV4QMEY6
 j5tVwM6EQXDbhLrRbi0l9WHxKlmGloR4ZYLchd07h6nwRhjyPAiyW019KYBgTzbtxxV2
 lT0f29bRz8fqS156hpmBfpjEsVst8Phwe8kIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5hL77yfrLKfTCKAlEtnBVweGId1RZY6S2a2PQXwqLg4=;
 b=L//2N8fYWmXH5MokNUqsCkC0VCmf/NRrRZXTOYGlda7Y89j6dTJ4MXI4x7DJjkF6n9
 LsHaLYLw3BkV4R3eZLmbr8NkJlrLTQ2hNRLxqhEw4JRT57/G0tLpBty7WozMFFuCzTPp
 /wd7KBBNLgx7g6M+6C2KW8UqsfIUi1FfcRbUr15T09Cnxk8tncjMiOPYwHwCSn+IpQ3N
 0pIYVz5DoGInrCVP/zNPlGflKbivAhwsZvYq8zj4fCfh4uVnIo+dA0rHJ3OxF6IP31cP
 WJTL9bt7la3UqlOVx/lLwhugZgR7FQQq3PeCtDsCAQpz6PLRbVfCRMP/seqLu3rMDS/p
 zdGg==
X-Gm-Message-State: AFqh2kqCoWhvyylByKQHplXVi0aopt+3ase6fTmK4vmyg4VbST3aU8TN
 WreB+x7Gzbj7RzpFXV7F0Vq2jIkpDXiWLA4=
X-Google-Smtp-Source: AMrXdXuz0ugzJxVErbPgYRGmI2CrTHxYcA2ccwEXV3hYABQAcN7XX00eqewY41eJNhrsISrMS5HcpA==
X-Received: by 2002:a05:6a21:1707:b0:af:7773:9535 with SMTP id
 nv7-20020a056a21170700b000af77739535mr88860757pzb.33.1673635839225; 
 Fri, 13 Jan 2023 10:50:39 -0800 (PST)
Received: from localhost ([2620:15c:9d:4:2017:603c:987:371b])
 by smtp.gmail.com with UTF8SMTPSA id
 f7-20020a623807000000b00589500f19d0sm9636233pfa.142.2023.01.13.10.50.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 10:50:38 -0800 (PST)
From: cujomalainey@chromium.org
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ucm: add existence checks to geti calls
Date: Fri, 13 Jan 2023 10:50:19 -0800
Message-Id: <20230113185019.1500147-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230112234426.1714071-1-cujomalainey@chromium.org>
References: <20230112234426.1714071-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Curtis Malainey <cujomalainey@chromium.org>, tiwai@suse.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

Right now in snd_use_case_geti you cannot tell if the item being queried
exists or not when being checked. This also means the only way to check
for the existence of something in the client of the library is to
iterate over the list of mods/devs even if we know exactly the name we
are looking for. We have functions that do exactly this internally so
lets return this information in a logical fashion through geti.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 src/ucm/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/src/ucm/main.c b/src/ucm/main.c
index 2ff4d3f3..adbddc26 100644
--- a/src/ucm/main.c
+++ b/src/ucm/main.c
@@ -1321,6 +1321,9 @@ long device_status(snd_use_case_mgr_t *uc_mgr,
 		if (strcmp(dev->name, device_name) == 0)
 			return 1;
 	}
+	dev = find_device(uc_mgr, uc_mgr->active_verb, device_name, 0);
+	if (!dev)
+		return -ENOENT;
 	return 0;
 }
 
@@ -1335,6 +1338,9 @@ long modifier_status(snd_use_case_mgr_t *uc_mgr,
 		if (strcmp(mod->name, modifier_name) == 0)
 			return 1;
 	}
+	mod = find_modifier(uc_mgr, uc_mgr->active_verb, modifier_name, 0);
+	if (!mod)
+		return -ENOENT;
 	return 0;
 }
 
-- 
2.39.0.314.g84b9a713c41-goog

