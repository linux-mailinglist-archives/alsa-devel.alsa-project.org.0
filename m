Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B54FC905C4A
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 21:49:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B574A4D;
	Wed, 12 Jun 2024 21:49:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B574A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718221764;
	bh=w9Rt34g1NAf/lnKTJg1QsLQtDqnhENK4/kBjulfr7rY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=b/1nk7+Y+ecNF4YgfpOFT+Zrn7SMpU1C93PfLnu0Jg9+5kiKiPsbX7GFDXFH7CGv9
	 rOXPX9U18VQD+X6dE03wczLTDNbX+/c8S2dz9JlY1XYnqG9hunO0cbc/PE17N0gNGl
	 ym8gGZvO+Jfj+yybr7GKVkMC6zncHQGFQRylFIcg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA5E6F805B6; Wed, 12 Jun 2024 21:48:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00736F805B4;
	Wed, 12 Jun 2024 21:48:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13180F8057A; Wed, 12 Jun 2024 21:48:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AC94F80496
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 21:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AC94F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UBz2Lywz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1B2DFCE221F;
	Wed, 12 Jun 2024 19:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2CBC116B1;
	Wed, 12 Jun 2024 19:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718221717;
	bh=w9Rt34g1NAf/lnKTJg1QsLQtDqnhENK4/kBjulfr7rY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=UBz2LywzLFDOZ7FwxFb/8JQqDuxFgpSB2MSF8QkfdmYyzSk/kBHZcZcUU0kMc/hsI
	 KwhQnhPUH1TirCyo2cWZdbv6aqXM12U/6I6bz5iPY16pD4U4dm61Q+aPgDdxG7adsQ
	 ZYJaLYXQnZX6aN1EsKzBXq9Ua+6UF6tcGTDlVA3Z8H+nIHx3BiP1eQiuqMRt4i0/b6
	 HErYT7A0SUYyN0LkUqgEYJrB2q71YKPKYzR9L/nu5Rul4oItu5eeC350qwMBJAh6y1
	 hlzyZb97ABGU8sUwcboQASjG8vyZ7wEYqfebX+DQE1aH6fXZQN2qUPyAa7v4RxJ9yz
	 XQ1cPLLoBonTg==
Date: Wed, 12 Jun 2024 14:48:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	=?utf-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 1/3] PCI: pci_ids: add INTEL_HDA_PTL
Message-ID: <20240612194834.GA1034127@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240612064709.51141-2-pierre-louis.bossart@linux.intel.com>
Message-ID-Hash: PWUJTN274F6IACK33MUXYT5EO2RPAJO3
X-Message-ID-Hash: PWUJTN274F6IACK33MUXYT5EO2RPAJO3
X-MailFrom: helgaas@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PWUJTN274F6IACK33MUXYT5EO2RPAJO3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 12, 2024 at 08:47:07AM +0200, Pierre-Louis Bossart wrote:
> More PCI ids for Intel audio.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>

Change subject to match history:

  PCI: Add INTEL_HDA_PTL to pci_ids.h

It's helpful mention the places where this will be used in the commit
log because we only add things here when they're used in more than one
place.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  include/linux/pci_ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 942a587bb97e..0168c6a60148 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -3112,6 +3112,7 @@
>  #define PCI_DEVICE_ID_INTEL_HDA_LNL_P	0xa828
>  #define PCI_DEVICE_ID_INTEL_S21152BB	0xb152
>  #define PCI_DEVICE_ID_INTEL_HDA_BMG	0xe2f7
> +#define PCI_DEVICE_ID_INTEL_HDA_PTL	0xe428
>  #define PCI_DEVICE_ID_INTEL_HDA_CML_R	0xf0c8
>  #define PCI_DEVICE_ID_INTEL_HDA_RKL_S	0xf1c8
>  
> -- 
> 2.43.0
> 
