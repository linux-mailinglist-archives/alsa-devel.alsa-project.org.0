Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B4D89081A
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Mar 2024 19:16:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 395E82C3B;
	Thu, 28 Mar 2024 19:16:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 395E82C3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711649809;
	bh=XYumxhYQMlVXPyD6eFz7QV/Af0iVgBK9pjvmrjbn53I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TM5e4UXRu90OXv1km5w8gUZNjhgVQANkskCGbswXtl9HqfChzbqrrm19ygUMBg7rH
	 9ghZSeV7JfmD7feYcsMGo5kf5dJv8YXbHNMTiM76VHVgrZ1hV8L0epN74MrUmFTorZ
	 aI3n0Ob+lJLBQvPOkQzZIf8ZmI4keCuhFiNBKKwU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72D4BF805D9; Thu, 28 Mar 2024 19:16:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4AADF805C6;
	Thu, 28 Mar 2024 19:16:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41ED2F805B1; Thu, 28 Mar 2024 19:16:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08984F8057B
	for <alsa-devel@alsa-project.org>; Thu, 28 Mar 2024 19:15:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08984F8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Srlt5lru
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 454E9CE294B;
	Thu, 28 Mar 2024 18:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E00FC433F1;
	Thu, 28 Mar 2024 18:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711649756;
	bh=XYumxhYQMlVXPyD6eFz7QV/Af0iVgBK9pjvmrjbn53I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Srlt5lru4pZE9gnz9nYJ33Bhg1GtU7BoRo14z6mUvxVjUafLV/W5t6OcD48DTSLun
	 K/NHOlsULIG1LYtQux+ai9Eloc6jc66HzJznVREy0ej7GJ7VsK/vmL2COHrbr6ZYWI
	 1kgTjRatEz0LYKEQuxt794DRZqHmhlyNhCpUQCjjzD7rJy05ebhSBRTqVwzlhKbLgQ
	 lpQl5x5eqyLAczCE28+3xNbCzG8V2lKQ5qeKNh4Y6+GOipTIG0izLnGiPeF1uVHN02
	 BpztGVoGQVN35b2g3j4+dpKTXci8wGRg0nQ/iFGh6NO/9y6gsyt6VxvFNnSEWF43VP
	 CdaVM2ijP9MlA==
From: Vinod Koul <vkoul@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, kernel@pengutronix.de
In-Reply-To: <20240307180359.190008-2-u.kleine-koenig@pengutronix.de>
References: <20240307180359.190008-2-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] soundwire: qcom: Convert to platform remove callback
 returning void
Message-Id: <171164975143.128475.15075246895425655363.b4-ty@kernel.org>
Date: Thu, 28 Mar 2024 23:45:51 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3
Message-ID-Hash: GFRH5ACH76C6EQXDODSX2USAOE7TK3KB
X-Message-ID-Hash: GFRH5ACH76C6EQXDODSX2USAOE7TK3KB
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GFRH5ACH76C6EQXDODSX2USAOE7TK3KB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 07 Mar 2024 19:03:59 +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> [...]

Applied, thanks!

[1/1] soundwire: qcom: Convert to platform remove callback returning void
      commit: fe12bec586332f3f84feea6dddad15d40889034a

Best regards,
-- 
~Vinod


