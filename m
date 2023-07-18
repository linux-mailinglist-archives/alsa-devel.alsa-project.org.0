Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2B7757DC3
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 15:36:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BB4D4E;
	Tue, 18 Jul 2023 15:35:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BB4D4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689687377;
	bh=87x/ZiICR+wjR2rxh0LCkN4th6j+MlFTVrqott7G8JI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K5tV4CmEVQ4SuKC5Hgnc3d+MTRn/8brXalOFr2MUNTyMKr7oiZ8xSxv2oPrr3uDKR
	 tleU74+emLaCfnEDZ/DwvqxiE5JsVovTNUD0vfGtm/TmszgZo+h2IAQ5YhrdbwdFJe
	 ijWLaEj5GlCcxKh27Np4doaTAL8Zkxk4mxSKEpKs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BF3DF8027B; Tue, 18 Jul 2023 15:35:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD3A4F8027B;
	Tue, 18 Jul 2023 15:35:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 108C4F8032D; Tue, 18 Jul 2023 15:35:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A482BF800D2
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 15:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A482BF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=Gw9YXTCx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC3886157A;
	Tue, 18 Jul 2023 13:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ABEAC433C9;
	Tue, 18 Jul 2023 13:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689687312;
	bh=87x/ZiICR+wjR2rxh0LCkN4th6j+MlFTVrqott7G8JI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gw9YXTCxOIGRmdlzFeIxvMZpmglLv3KMDBtgMHMqX5xa+LT3ujlhNLKB1AUCE2LCW
	 shvyT4eaxIqTQoU/fhQGMOEZNc/Lv9+kNA0ZSXQQRxCHI3jbiKA+fmQ5r2irqSIbTR
	 PTwXRkrdu1EQoVygN47SgtA3iexsKIeQvxXu6I/A=
Date: Tue, 18 Jul 2023 15:35:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: Re: [PATCH v2 2/5] platform: Provide stubs for !HAS_IOMEM builds
Message-ID: <2023071855-decimal-sarcastic-65b9@gregkh>
References: <20230718-asoc-topology-kunit-enable-v2-0-0ee11e662b92@kernel.org>
 <20230718-asoc-topology-kunit-enable-v2-2-0ee11e662b92@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20230718-asoc-topology-kunit-enable-v2-2-0ee11e662b92@kernel.org>
Message-ID-Hash: 2UKOBD2FPJIUCFL57ETVT4NQIVBXZUKC
X-Message-ID-Hash: 2UKOBD2FPJIUCFL57ETVT4NQIVBXZUKC
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2UKOBD2FPJIUCFL57ETVT4NQIVBXZUKC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 18, 2023 at 01:28:43AM +0100, Mark Brown wrote:
> The various _ioremap_resource functions are not built when
> CONFIG_HAS_IOMEM is disabled but no stubs are provided. Given how
> widespread IOMEM usage is in drivers and how rare !IOMEM configurations
> are in practical use let's just provide some stubs so users will build
> without having to add explicit dependencies on IOMEM.
> 
> The most likely use case is builds with UML for KUnit testing.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  include/linux/platform_device.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
