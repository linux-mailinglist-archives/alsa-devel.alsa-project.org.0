Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 852EC853420
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 16:04:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34A54DE5;
	Tue, 13 Feb 2024 16:04:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34A54DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707836692;
	bh=x/FWpmXs+siXuzRbLc5xCsGrjSZxXzgMpFp8jCEzOjs=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=d7jk5EFA0FN5MXpCd9BoynMzYZ2JtXRctZE5uA1Bw/RyMg4yObA191AzjbUdLjalB
	 vJH+6po16VqivuGEK4HcABeCU+Z/MahBgZFOdDVk9TZPeQhdU7qkBVk2bqyqw+JK2s
	 FyVYFcRu45SkbFuvm7/FjYrh7xmYdIz3s7qEAbeU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0052F806F5; Tue, 13 Feb 2024 16:02:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FD7DF806D3;
	Tue, 13 Feb 2024 16:02:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AFF1F80238; Tue, 13 Feb 2024 15:36:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECB13F80104
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 15:36:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECB13F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256
 header.s=2024 header.b=aajLScVO
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6e0ac91e1e9so1831198b3a.3
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Feb 2024 06:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707834984; x=1708439784;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkAxiX5r+VqIkIVkIJIct9tXU0xaPqHrJhoy5Wg6JmQ=;
        b=J9ZTklHHk5Gyu69R2A7YeXFqCw88Jc0trzPCJFvN4xdsovASrE8mDyBO9Xz6Et/fem
         dl/RvyPwG6OUEA+UpB2814ldJHtMTMvly5mkJYK5vQJaNbhX8HXO2DtyGu3EqZKf7knA
         L59NAvmG4WVt4cmxUbA/57ipzeH/4iAT8idips0g2hIcyEJWrrVfl57howVxoPmnQiJ0
         d6kVIedx6Gk3dp6Qh6I4CP6W7KiB98sMvETMcYTMIlSnIH5d8laJtDAkf0n0GRrZnaI3
         ff2k89sFyxIj3VKRX9t7SXEOEbzRaI3ly8q3YKdcASxGaLQUstftosqfOmd+089bhUj8
         WGig==
X-Gm-Message-State: AOJu0YyO2laLosiBt2JL9+ZDeAOnJhg4k8buaM+hsz5KCWZY+xEM8BIZ
	ScBjX6yFCY0V4oaOuO1sI19cdowF0SX2PrvlHR/O2RpuclltYq2vI9ujIbrakrw4JQ==
X-Google-Smtp-Source: 
 AGHT+IFWNiOxtnLB/vhItTI5nJ+dnjka+iTBPwAaQ8p7fl/ouHrR/zhf2dsNYXwdM2v2Cf8fkWVKiQ==
X-Received: by 2002:a05:6a21:6315:b0:19c:8a1a:d9a8 with SMTP id
 wu21-20020a056a21631500b0019c8a1ad9a8mr7732353pzb.42.1707834984275;
        Tue, 13 Feb 2024 06:36:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVYoBI2HC6Ero9ydjm4RWT08l5qQp3ZaPPt2KWGygKLK3JnPpJ+7TgoqRdJEB+iSgJdTeW5gQFoJyh1QfeQUA8gcCXBucSx0y7ylWHj59empEYaCjeu2dayc9NM+lgOO9E5jQRpJABkG5k9nzeYu5IiGOASKwDuAFiC04z+huvEW2t2xo2EkPziNbFhq+CrXRoQ5h6ByHKq6erHpWs6v+2+PMymNAiu/bWk7nGGqiX8Bu8Lbisn1piX7vrlif86gvN1+HWD6yvzPw==
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id
 fm25-20020a056a002f9900b006de050cf904sm7506820pfb.22.2024.02.13.06.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 06:36:23 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707834982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YkAxiX5r+VqIkIVkIJIct9tXU0xaPqHrJhoy5Wg6JmQ=;
	b=aajLScVOulKlWmcSRQr3Nsc+qGxRAacWpO1TvOEjcogAyXCLWEvo5Fegu5Z3FSyMc2uWQ7
	fQB8cfPh8NjuY3zYvmMqs6GYN2nvgEEfG5sMAAg+MqM4r72UdAscbRMdgYOpjxqyuRKCkl
	RH5Bf+MhqdeLAMgYzvyHB+hAZ47n5FgTSZPuRpIDZccH1+JoD4kJAvQPQKX0SUXHNTFZBq
	Tu4sOSd78YMfvOPAcXKk3qa21u18I87Q4CNpuNw/GCwrWCaALOl7dDRCowtfzRVt/NAoOy
	KdgkS5U/Ht1Qj/PEm0MTEhln0zrdvh0coZIGQECZgD/QdqjiuMHDzVLKZlIn4Q==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Tue, 13 Feb 2024 11:36:56 -0300
Subject: [PATCH] soundwire: bus_type: make sdw_bus_type const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240213-bus_cleanup-soundwire-v1-1-3878b00f6f57@marliere.net>
X-B4-Tracking: v=1; b=H4sIAId+y2UC/x3MQQqAIBBA0avErBPSSqKrRITpWANh4WAF0d2Tl
 m/x/wOMkZChLx6IeBLTHjJkWYBdTVhQkMsGVammUrIWc+LJbmhCOgTvKbiLIopubrXVnVboJeT
 2iOjp/r/D+L4fPwmJqmcAAAA=
To: Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=x/FWpmXs+siXuzRbLc5xCsGrjSZxXzgMpFp8jCEzOjs=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBly36KrVxI+PQGmAsH0w2t1jeZA2FxQ6MOj2qEK
 2oGW2jj4EqJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZct+igAKCRDJC4p8Y4ZY
 pltbEACoPQZ26lL/izzlySfi4VuAnNfVsedcSulBaj0v6Ea02cKw2/Ov5fkJ33ocppgQWB3YSMo
 LG5XLMoN7+vlkXfTKM3sWCG77bgACP0O01pqgNj+16zL7iOnh9JQoIfyyAYCivsUyBF1P9Ly4sK
 KtUvSBRogxPm3he5aQuwA6JKHP6ijTyi9qihAO5k9wtmtP2E5ig1d5EbsS/flA3zYB9y+PuHiTK
 sfjiTmNi0UybAqayGTt+MhsjDOZ9/UnPiNJI0in5FRF3//sAYz1WJPtV8ibPc7k/NOkq9W1QIzX
 jglIarP6/kfsaMEYeJCB6X/8pEqQGPiV++FFBbdI8YS3OViEZLeRY+OvyYCfOeendzje3qd+aVZ
 z+SX7WnlWHMfIQK0faD9Li20vtWkqiGl6wgIgMozotUFlp0QjbbGUI8h4RXZ8IrvYw8iiUvYzak
 IADSS/YUKuFyu2qEUy+BVG5yKihzv0DPVda9va038hdaTmGnSmBtbFUwxttX3PmjiLT5iVIV2sd
 im8BgqYBGkvTzF5qv48SvOm9RuOkOqc5T2R5pXUoJFYTTIdBbCecV6OTjnRvKXP9UqJTeFHXTaJ
 41liBO+jg3frKWvUm/q2rc0E6lB7lJI3D4JP9Emz1XcWok/sDlaS8ZFt57lJG/w3Qppt2uBuzB5
 O/kZXaxuWCUG1/Q==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-MailFrom: rbmarliere@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2G276UYVQW4AEDRPJRYCUVJN4QAHANXC
X-Message-ID-Hash: 2G276UYVQW4AEDRPJRYCUVJN4QAHANXC
X-Mailman-Approved-At: Tue, 13 Feb 2024 15:02:23 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2G276UYVQW4AEDRPJRYCUVJN4QAHANXC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since commit d492cc2573a0 ("driver core: device.h: make struct
bus_type a const *"), the driver core can properly handle constant
struct bus_type, move the sdw_bus_type variable to be a constant
structure as well, placing it into read-only memory which can not be
modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/soundwire/bus_type.c       | 2 +-
 include/linux/soundwire/sdw_type.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 9fa93bb923d7..fd65b2360fc1 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -72,7 +72,7 @@ int sdw_slave_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	return 0;
 }
 
-struct bus_type sdw_bus_type = {
+const struct bus_type sdw_bus_type = {
 	.name = "soundwire",
 	.match = sdw_bus_match,
 };
diff --git a/include/linux/soundwire/sdw_type.h b/include/linux/soundwire/sdw_type.h
index d8c27f1e5559..b445f7200f06 100644
--- a/include/linux/soundwire/sdw_type.h
+++ b/include/linux/soundwire/sdw_type.h
@@ -4,7 +4,7 @@
 #ifndef __SOUNDWIRE_TYPES_H
 #define __SOUNDWIRE_TYPES_H
 
-extern struct bus_type sdw_bus_type;
+extern const struct bus_type sdw_bus_type;
 extern struct device_type sdw_slave_type;
 extern struct device_type sdw_master_type;
 

---
base-commit: 9282cfa2eb080e3bbb95f488af35618b614cdf76
change-id: 20240213-bus_cleanup-soundwire-8b56c6862ef1

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

