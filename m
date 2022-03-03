Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D52564CE3A5
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Mar 2022 09:39:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A20601ACA;
	Sat,  5 Mar 2022 09:38:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A20601ACA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646469552;
	bh=SGMF6oSM44wO/3sji0yXCG/PEtOPShxdSQ68WLQRB2g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B8LbgEqCZoQ02336ZZDAGiBkWdAg1uu5Q+5vn2VlM5FP97MB2KUhBUZkMQEeBJ8Eo
	 m7gxX9GvXJeupro9feuxkpw3PGT2puE1lf2GtAb703JKhRuKKV4zupUd6wthjeL2Q1
	 EIav1V2AChdLTs6k5q55Mk+PI6FnIOxnJaWLdKdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91375F8051E;
	Sat,  5 Mar 2022 09:36:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8873EF8013D; Thu,  3 Mar 2022 09:39:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11811F8013D
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 09:38:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11811F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZvINIOlH"
Received: by mail-pf1-x432.google.com with SMTP id d17so4220322pfl.0
 for <alsa-devel@alsa-project.org>; Thu, 03 Mar 2022 00:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SGMF6oSM44wO/3sji0yXCG/PEtOPShxdSQ68WLQRB2g=;
 b=ZvINIOlHF3nZHDcX3MwxAzlzprOUAV7bE6ys/MgPVlfVq9lkuahVjDHsPLQ7QbaFo9
 fQEFqUdMgi81YiKV62ulZnN7ZvbWazV6yRB1Qn/XiuQndMVO9fvHUymuPfTr2Dg+jh50
 vUEnvjC71yyLrdhZGmiVJ4PzTrzLKfXKpEMH9pkW4eVCRVAqTfa9XuvSN7zcx65Vy8CK
 d46NAYhkVq2HOhizng3Ws+JRbkWyYjQl4vq/u0RRAuHhPVUlG5PBN7oH7sIbE0gusQ26
 6C+XTV9PxP4Ds6jAKJQCAmbFUS0yNAc3zTUs7Z/QKxXKC+XQ8KtJ4GqninQZxzg5r19Q
 dsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SGMF6oSM44wO/3sji0yXCG/PEtOPShxdSQ68WLQRB2g=;
 b=ajsCZV8Um6D+lE7oZV1vcp4KBnLToq19TzyTAgaLMErjBdd5txggYNYFkx1wMM0Vu3
 wLw9mT3UIXpoHMeDPL7qu4H+9BZXztTMTJUP6vbB29dFQvXhA9wDK/2YIN4MF1mia3yG
 PyhBlhJ6v6yKQtWpBFvuqU374BR3lWzOobw+paoE7DQNCQRCZwfbMvumtTWnCmcWN1ZG
 M5wlU0FypIN31a3/xjbDWAeU59pPTbuO5SlEfstu8FXRsrHQIO5yVuT8ou11Xqdq77A3
 xYO4yA4ulT7UWqWQVYDnY2lJwtf+rOPQ+kxK3OWSUsZauUWKf2EfQPCgwetI6LbW7h+w
 hGTQ==
X-Gm-Message-State: AOAM530iF7mvjKNf9gzNZzt+hD8NQgUYS0/YT9uERsrPxw8OoGmOK+VD
 LzoIThoowK9Z3VMuTUXzGDE=
X-Google-Smtp-Source: ABdhPJxqu7M+1zWgFCPBx1x396RDv729JpxnE5pMePfUDpYTg5HqtDHmeV1ToBxB32C6BUNb5VRxjw==
X-Received: by 2002:a63:f03:0:b0:374:50b5:1432 with SMTP id
 e3-20020a630f03000000b0037450b51432mr28638188pgl.308.1646296735582; 
 Thu, 03 Mar 2022 00:38:55 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.19])
 by smtp.googlemail.com with ESMTPSA id
 q92-20020a17090a1b6500b001bc169e26aasm6405436pjq.2.2022.03.03.00.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 00:38:54 -0800 (PST)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: xiam0nd.tong@gmail.com
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Date: Thu,  3 Mar 2022 16:38:31 +0800
Message-Id: <20220303083831.11833-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303083007.11640-1-xiam0nd.tong@gmail.com>
References: <20220303083007.11640-1-xiam0nd.tong@gmail.com>
X-Mailman-Approved-At: Sat, 05 Mar 2022 09:36:45 +0100
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, gustavo@embeddedor.com,
 linux-iio@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux@rasmusvillemoes.dk, dri-devel@lists.freedesktop.org, c.giuffrida@vu.nl,
 amd-gfx@lists.freedesktop.org, torvalds@linux-foundation.org,
 samba-technical@lists.samba.org, linux1394-devel@lists.sourceforge.net,
 drbd-dev@lists.linbit.com, linux-arch@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, h.j.bos@vu.nl, jgg@ziepe.ca,
 intel-wired-lan@lists.osuosl.org, nouveau@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, dan.carpenter@oracle.com,
 linux-media@vger.kernel.org, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 bjohannesmeyer@gmail.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, christophe.jaillet@wanadoo.fr,
 jakobkoschel@gmail.com, v9fs-developer@lists.sourceforge.net,
 linux-tegra@vger.kernel.org, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 linux-sgx@vger.kernel.org, nathan@kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 David.Laight@ACULAB.COM, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mediatek@lists.infradead.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, christian.koenig@amd.com, rppt@kernel.org
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

correct for typo:

-for (struct list_head *list = head->next, cond = (struct list_head *)-1; cond == (struct list_head *)-1; cond = NULL) \
+for (struct list_head *list = head->next, *cond = (struct list_head *)-1; cond == (struct list_head *)-1; cond = NULL) \

--
Xiaomeng Tong
