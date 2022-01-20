Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A735A495443
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 19:36:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 425242A18;
	Thu, 20 Jan 2022 19:35:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 425242A18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642703777;
	bh=FHUSnLFWVr68wK0Ueu0o2cPAOvYPnfmPNV0janXaZlA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UDhmFmsZOTRJqHCR9VVrtfHjIUerj0ejmHPlpq0iIC4vbxNevlmGWUovbV/wZvnOH
	 Ia1Gu+iG2fhStO2Bfl+ZfqSYnEexqiCDTJaDto6dpHgz6JepLbO85XaqUTP/waEuqC
	 IGGk4Z/9rnbIvCH843BNATcmYoCeeSgjc5+bPgO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4602F80134;
	Thu, 20 Jan 2022 19:35:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75221F8012E; Thu, 20 Jan 2022 19:35:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F6F6F800F8
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 19:35:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F6F6F800F8
Received: by mail-qt1-f177.google.com with SMTP id c3so5415985qtc.8
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 10:35:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FHUSnLFWVr68wK0Ueu0o2cPAOvYPnfmPNV0janXaZlA=;
 b=3pyRA4z1pil1KafLTcNsujma1K+bhpwC9yxqCuwTt91N8PosniXMBQFkVNN+/RROX5
 P8K54L2XpQE9r9lMQEfhTU2NYf4Qf5jmoDyjKDbPlsKcIdftlB2aqdFh0nRbGeWkA9wW
 4bPFLUwQ2p89hd5J1PQviSAAN87uACgmUJ1KeZNsLtQz9MtGdIPPza0S6R/wKR1CCBuC
 11vSNd7yZCwaakT1+Tck+FbR9oevI2wVnFSgLSRa9fJNOTs9JWLYh3aFfaBTgawWcTCz
 TnCXKfVAuEdtfo/fnb5kjVUksf2/8sEY4GGydpleC5DOKfytqk1MuFWFCcotyBd3K/1B
 irtA==
X-Gm-Message-State: AOAM530S53kA6EDms415yqv5LGkKVgo9G1ubuYYk1zeBjUOTrjq8wxjB
 xtZlSWwdRcR3ydbxp+XR2tCMNj7b2WM+Pq6jXRA=
X-Google-Smtp-Source: ABdhPJxh8V2QeLQ/nWDipxCe0AWBLibWjl1rR7AAvTNd5Zde1YaKr6zv8pxnq0y9HBHVpHGY9eLCQVr2gN8l/fCMgfc=
X-Received: by 2002:a05:622a:1881:: with SMTP id
 v1mr256994qtc.327.1642703703992; 
 Thu, 20 Jan 2022 10:35:03 -0800 (PST)
MIME-Version: 1.0
References: <20220120134326.5295-1-sbinding@opensource.cirrus.com>
 <20220120134326.5295-6-sbinding@opensource.cirrus.com>
In-Reply-To: <20220120134326.5295-6-sbinding@opensource.cirrus.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 20 Jan 2022 19:34:53 +0100
Message-ID: <CAJZ5v0hMdfnu5PUk3sPvzF_f+xvWaRkE=BUpSAFx_DJ9sB+JDw@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] platform/x86: i2c-multi-instantiate: Rename it for
 a generic bus driver name
To: Stefan Binding <sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 patches@opensource.cirrus.com, linux-spi <linux-spi@vger.kernel.org>,
 Len Brown <lenb@kernel.org>
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

On Thu, Jan 20, 2022 at 2:43 PM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> From: Lucas Tanure <tanureal@opensource.cirrus.com>
>
> Rename I2C multi instantiate driver to bus-multi-instantiate for
> upcoming addition of SPI support

TBH, I don't particularly like the new naming.

Namely, the "bus" part seems overly generic (and the "bmi"
abbreviation brings something totally different to mind).

AFAICS this can cover serial interfaces only and specifically the ones
where serial links can be represented as resources returned by the
ACPI _CRS object.

I would call it serial-multi-instance or similar.
