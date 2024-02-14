Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C4B85B455
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Feb 2024 09:02:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCDD6E85;
	Tue, 20 Feb 2024 09:02:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCDD6E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708416165;
	bh=X6od+QN5zi3KBcLvJ2WmLsxhFSgPUZijlXB3ig3ROOk=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Kvc8pG19MXUZHHuClICGXLGF2U1HvyXMvGSSDkeNe7EnDTeKHkEPfdA4VmL2LwxT1
	 R954QOYjZ29wSzPCjb/rC8/3CXUv+IyIKpRUJy17v+ZTXMZUJay2GV7kEvbmdM3fP8
	 JpofYebrib4MpbOQsWUF9kKSsF3/TExxgHECq+xk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A46EF805C4; Tue, 20 Feb 2024 09:01:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1AB1F805D4;
	Tue, 20 Feb 2024 09:01:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91AC5F8015B; Wed, 14 Feb 2024 20:28:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1ECDEF80104
	for <alsa-devel@alsa-project.org>; Wed, 14 Feb 2024 20:27:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ECDEF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256
 header.s=2024 header.b=maPFus1q
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-5c6bd3100fcso79361a12.3
        for <alsa-devel@alsa-project.org>;
 Wed, 14 Feb 2024 11:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707938876; x=1708543676;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:dkim-signature:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KnjRLwW6qeAAWQgWTvjpbNM3OaTV5ZKjGAIc59AkD9c=;
        b=S4RrDWq6/FN8Lxg5kZmNAklR7KigQ3PDzEGCQQjA33M3uMojw3PgrRn1aFmrMELqsG
         Pfzsh7OQ/f9UKGa2rw3234krH1++YIn9aBJRZAOJh16wsGPCbwUiXg+b3olJjcd1RWtQ
         gIobtnAYMk4EppxCZM+8GIXzlpuFCKsDNmRL06g1bG3Mn/QkADuVwA5zq1zIWQPmAHTu
         l9TCfEbPOQrWooHuYpHUQuSiV05wkEpjC2Xa8KZ5abJZTgSCUnbP5FEYlv5FUvwL7h7O
         efMc3yFcujYL9VKRnxvG3IgBvvYbRxxTnOFzYSlCRzcHEqmNCLf4Wx9qrnOzwH0qcMKT
         IA3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX71mxURFeTsaeurzQbl+U+n3iSm3hs/J8sGt4OxhLKmaOlBuWcdaiMw2555KJMy79tqGYrCTWrd+7Xmboxuhmafkj+nxaTEa290Gw=
X-Gm-Message-State: AOJu0YzodOePLnKvl4gzsWZfJNhdrmukoPRqc4355lRLtj0ChrJZYsuz
	PDL4grIMcryD5oJT6O8CoC54zu7PdK86/d9bqbJQZDuEl3HSCMBYXfDknvPCzyj7Tg==
X-Google-Smtp-Source: 
 AGHT+IHegGu1Lc6JHujte9HWk+U849QrRHwoSPJSqWXl8c+HXhJmNQ+qoZKZb3gAFc+W2fsg/d5Lhw==
X-Received: by 2002:a05:6a20:93aa:b0:19a:fa19:23e7 with SMTP id
 x42-20020a056a2093aa00b0019afa1923e7mr4662887pzh.55.1707938875745;
        Wed, 14 Feb 2024 11:27:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUa34KWh09rSYQyE9nF7fJS3F2IPd03THcCf9aU6FQa3IAiDx1LsWllRCgEoniJtv6tsGHfNIO0J5zRs4HHxiXtfuO9TRPplBhygbzpf3W1S417xhgXdaxak/bluiAQCC+BEUqkffVilz9bdq2CvrThtjeRQvhINJOjZOQVpnZ8ycw8ED62RTnUoUNr8R9Fx/74p4zsKsu+ZRRbF6LfSZFgEsj8SrOFgBOVuY1GkZ6eM1U43plxZeDsTM59OBmUJBVFwQ==
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id
 ei52-20020a056a0080f400b006e0e4b9b7e6sm5566104pfb.212.2024.02.14.11.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 11:27:55 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707938873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KnjRLwW6qeAAWQgWTvjpbNM3OaTV5ZKjGAIc59AkD9c=;
	b=maPFus1qp9Xv5h9LhLO+NfqqYYnwQda7r95wUFaLGv+wjMlY//L1rO5mAM6+NuhKi900w+
	Lf5zn4iwdVvNADXICzlFQiYMjZttHE3P20l+6DMp6IPvf/VhZEh7A7NiTtGPASS2aAkMGe
	TrAERZ6ibNQcJkNcxOeT1N5ZNTVPay7LVnGz2rffqx04lf3yZ5I/8H1I8Ueq4EVbM4hqP1
	TToN3I7P0vSlPM7R9mdo/8bHDD/BljTvAywkAYlKB0zy8cGEHEQDreR9SXYfAH6Zp8roGy
	iYj+fS6ZmfupGcZmd1seEa+P4SjvDtvoL1WYG8GdzG3n3qYiGwK+OSDy0ongtA==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Subject: [PATCH 0/2] ALSA: struct bus_type cleanup
Date: Wed, 14 Feb 2024 16:28:27 -0300
Message-Id: <20240214-bus_cleanup-alsa-v1-0-8fedbb4afa94@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFwUzWUC/x3MQQqAIBBA0avErBNUsqCrRITZWANi4VAE4t2Tl
 m/xfwbGRMgwNhkSPsR0xgrVNuAOG3cUtFWDlrqTWnVivXlxAW28L2EDW6E2abx3vZHDCjW7Enp
 6/+U0l/IBlrASWWIAAAA=
To: Johannes Berg <johannes@sipsolutions.net>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1080; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=X6od+QN5zi3KBcLvJ2WmLsxhFSgPUZijlXB3ig3ROOk=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlzRRgqD50Kjh/z7zUDRvFGQ5rgpOi5V2O2AYGX
 hIUhjfS3WCJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZc0UYAAKCRDJC4p8Y4ZY
 pmcbEACD0T5RsUDq6fWHxNRzwotB+m1utHfTeWp77RvfXLKoZZIAHgmzUfz9dS3PErdHFheGoL0
 xKFWgt7H4f0/0/Yo3BJjY8Tw76AwIM7o2bGowLqAeFhJWdY12hSKPUPwI2IWTA4lVuXhm9nlSxP
 VQ5d8P6ISLYq71oVht5jOQmryblOVTmJ+IUoV81ELF/lFFIaQHM8nUsMtlKhls5m3U0nqpdA9Qn
 B1yvd6yIInkH2xrlR8LXpIwUaCnkmycURdEiwVNTxEKu0vNcnk0RXGB6361bsP7WYiZkAIP6EsP
 iBDMvJA4w8B+m39Rtvr0N837wC51+FmezpSNFXcd45iyIes4y4UMt0Cn258Xqlwkk8fZJlGFfqI
 BpTtlvAV5H4SnFovK3tpFGB9kaUQtlmiWriE82PYlrgppFS608qDCc8VTFUefNpLl+63MlTf7bU
 eUtVvA1eSMoS1TjO1D78+AX+0rwTr1SyO8cWnf5NFWjmr2wfEUWIC96OGYMBwmPC2FkKTAf85+z
 Hl/TbRFhpy+tW4dImZ1e7nO9rSN3ytLFR8cgUuTgD79cMBmV/08exealAOZHHV3tGm982wreRXJ
 mlTdedLshYOHDS3IEnMt3cNEcgznRJkKX1fcUXs2MbvZT/tkAgD5Sz4Q4kd4FP4AAQvc6EEC56/
 oVLkY93fN75xWWg==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-MailFrom: rbmarliere@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QWC6LWBA4DEV6PEAGMB27D57PUO6YKH3
X-Message-ID-Hash: QWC6LWBA4DEV6PEAGMB27D57PUO6YKH3
X-Mailman-Approved-At: Tue, 20 Feb 2024 07:59:37 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QWC6LWBA4DEV6PEAGMB27D57PUO6YKH3/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series is part of an effort to cleanup the users of the driver
core, as can be seen in many recent patches authored by Greg across the
tree (e.g. [1]).

---
[1]: https://lore.kernel.org/lkml/?q=f%3Agregkh%40linuxfoundation.org+s%3A%22make%22+and+s%3A%22const%22

To: Johannes Berg <johannes@sipsolutions.net>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc:  <linuxppc-dev@lists.ozlabs.org>
Cc:  <alsa-devel@alsa-project.org>
Cc:  <linux-sound@vger.kernel.org>
Cc:  <linux-kernel@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

---
Ricardo B. Marliere (2):
      ALSA: aoa: make soundbus_bus_type const
      ALSA: seq: make snd_seq_bus_type const

 sound/aoa/soundbus/core.c | 2 +-
 sound/core/seq_device.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: d7bf73809849463f76de42aad62c850305dd6c5d
change-id: 20240214-bus_cleanup-alsa-1d05ffc6507b

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

