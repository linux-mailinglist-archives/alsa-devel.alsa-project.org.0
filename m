Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC34AEB07D
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 09:50:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 369C560201;
	Fri, 27 Jun 2025 09:49:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 369C560201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751010601;
	bh=FolFMNiWnCqgMjqoIOy1OjdQzcgAecmWXevBqf25Koc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kLsMXMLQxYbLjsas7yZymH3WaKMhdaE/7oPfVU2zLw+UH1LT4B/1nTZv4chJG5Klf
	 YNqwvUskrgAZhM5XWewt1SSERzFUC1zbNpcqxKSSZchLaGUODjoxotZcCEjKqlVofw
	 c15g1kGIwyxhHBcBz8z+j1K5TeGDKTs2Ln7/+IyE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FE01F805C1; Fri, 27 Jun 2025 09:49:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 042EBF805C6;
	Fri, 27 Jun 2025 09:49:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8128F80217; Fri, 27 Jun 2025 09:49:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 053A3F80100
	for <alsa-devel@alsa-project.org>; Fri, 27 Jun 2025 09:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 053A3F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=M9EnCSxT
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4C72BA5230D;
	Fri, 27 Jun 2025 07:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13817C4CEE3;
	Fri, 27 Jun 2025 07:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751010558;
	bh=FolFMNiWnCqgMjqoIOy1OjdQzcgAecmWXevBqf25Koc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M9EnCSxTuwilq+SYIYM1CCDOE3H0PuOonBpOTtYEhKXfaquQZx52VSOZQCeJJLy40
	 qsHU7mcCXdJn5qpQYj9S8wXHsZ8KzApTuSGZeqQzSx+wb9RBo5U8KtZgrjtUbBzaCU
	 6x1+x3C7kFH+U0SpPB0VpEUYVmkeMa45XBwMrpSvSr3VmN8odgLnoR5s6zI+Dvv7nf
	 JyS37op8wAuqzgS/WCsFw2ER14QAKpTPAloyyxqj1n+GfTPEFbXG/n89TRr96s9RsN
	 zFxN1pbcfsZBYXaZXjNvlCPri0Wk7cCoYhnQ8i1eJfu/IO4eP5pxow6sMEyxEHHZbl
	 JoZYuxgDWWP4A==
Date: Fri, 27 Jun 2025 09:49:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: broonie@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com, tiwai@suse.de,
 alsa-devel@alsa-project.org, baojun.xu@ti.com,
	shenghao-ding@ti.com, liam.r.girdwood@intel.com, lgirdwood@gmail.com,
 robh@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, navada@ti.com,
 v-hampiholi@ti.com
Subject: Re: [PATCH v3 1/4] ASoc: tac5x1x: add codec driver tac5x1x family
Message-ID: <20250627-unyielding-unselfish-hippo-39ce6f@krzk-bin>
References: <20250626181334.1200-1-niranjan.hy@ti.com>
 <20250626181334.1200-2-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626181334.1200-2-niranjan.hy@ti.com>
Message-ID-Hash: NDRN6LC36HU5VXPY5T65OGAVDOKYSUQG
X-Message-ID-Hash: NDRN6LC36HU5VXPY5T65OGAVDOKYSUQG
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NDRN6LC36HU5VXPY5T65OGAVDOKYSUQG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 26, 2025 at 11:43:30PM +0530, Niranjan H Y wrote:
> tac5x1x family are series of low-power and high performance
> mono/stereo audio codecs consists of ADC and DAC combinations.
> The patch adds supports for Codecs(DAC & ADC), ADC only and
> DAC only configurations available in the tac5x1x family.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> 
> ---

Organize your patches correctly - you cannot have user of binding before
that binding is documented.  See submitting patches and writing bindings
in DT dir.

Best regards,
Krzysztof

