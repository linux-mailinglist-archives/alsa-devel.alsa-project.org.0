Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B3E36A8C8
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Apr 2021 20:15:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C9B1168E;
	Sun, 25 Apr 2021 20:14:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C9B1168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619374507;
	bh=D6nX/0NmTZz28tDzM/OBRdt8SeJwymcnUiiKYel3Npk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kIaRWR2/5yixHoFyf9GTQpxmQ+JgAiL9Xz2i2dv88RVSWXUr3VjXmFizOdkToDlha
	 fz1WELAB1oFPqTIaR04SXz9J0rqZ0zz/AawMnWALkRXFS9raMvcX9OsvN30Qu4mNsW
	 xGdMB8Dni0T86VIfLNARvlOGycbUy43ZT90yYKpo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F52AF801D8;
	Sun, 25 Apr 2021 20:13:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CD2BF801EC; Sun, 25 Apr 2021 20:13:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7B82F80086
 for <alsa-devel@alsa-project.org>; Sun, 25 Apr 2021 20:13:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7B82F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="banDX807"
Received: by mail-pg1-x52c.google.com with SMTP id m12so17893112pgr.9
 for <alsa-devel@alsa-project.org>; Sun, 25 Apr 2021 11:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D6nX/0NmTZz28tDzM/OBRdt8SeJwymcnUiiKYel3Npk=;
 b=banDX807b70mr4fqodTv5K5UVWBxUAmlubrg69UF9VKVYEntoGLAzys2jozmVSKxSV
 o2xJYaxY686X3KdVHXlnkgt3+l1YqsmQPuZtI55h0A7bn2HV8bh6gTTXICD/JFklyiBu
 iRoG7QBFW1zrxILAedH8+Zr56jFIqL8guk3ApLIGjCMZG9t/6qH4RedwGQMJJIHkistl
 NaDqMskhCODpixlVvnfYKFBrFUhEC1lUjkuJfDhKJoIPjSqLMAjOFnF+5LE9RgkisRmk
 0l8Ix4NyYC9jQgdb3qCT0wpDLYDUc+ZPAdD2T8NIRBfkJslOb8QZJjISSaefSAs4OSib
 vlsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D6nX/0NmTZz28tDzM/OBRdt8SeJwymcnUiiKYel3Npk=;
 b=dmCc3kf6WSseL7S0T7Am0JJMkdyiYjfWgB26yFJfMPZEuLk7IeWBO3+dyrRk3ATdpQ
 37CZT1nGDrVhoLZQzeTxusSp3hyp6HlX4G7DglePq8N+Pgems2LN68Gi5gHn1fMPS2+s
 XrJfihAx/yA+uRuem1Plvgirf3mUrAD3OjJKUI+4wKmNqxDskA0x7L2I08gkTtkpD+Tr
 DCAnLssViZbr0syAVAFatcXyheZZs7mq/ytcXRF7v9AhVc6VSr4IlDg3jbuTYJBJFDrV
 sctruNdxZkC4EkLtc4HW9XQXCxwcyprcFf/jRD6Izew+sypkGtY00xHuAvgnFYq0VQx7
 xLBg==
X-Gm-Message-State: AOAM532Eci68HIulQUjgs0O9Prsu0qKQQp4P40h630J9k0V5iFXBn4Iv
 DRF6lV+r087ZT7xXM6kZsHc=
X-Google-Smtp-Source: ABdhPJy7dGKH2m2YUnNgAjKkIpug6vaoumkV4jaY18C/n7kPVegQDEcv6G515xkhJQWCsOXxo5vh+Q==
X-Received: by 2002:a62:1b88:0:b029:1fb:d3d0:343a with SMTP id
 b130-20020a621b880000b02901fbd3d0343amr14205397pfb.76.1619374408778; 
 Sun, 25 Apr 2021 11:13:28 -0700 (PDT)
Received: from localhost.localdomain ([198.148.102.224])
 by smtp.gmail.com with ESMTPSA id v18sm9623719pff.90.2021.04.25.11.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 11:13:28 -0700 (PDT)
From: youling257 <youling257@gmail.com>
To: pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH 05/14] ASoC: Intel: boards: byt/cht: set card and driver
 name at run time
Date: Mon, 26 Apr 2021 02:13:04 +0800
Message-Id: <20210425181304.29280-1-youling257@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20201112223825.39765-6-pierre-louis.bossart@linux.intel.com>
References: <20201112223825.39765-6-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, ranjani.sridharan@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, rander.wang@linux.intel.com
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

What`s the mean? how to use kernel parameter at run time?
