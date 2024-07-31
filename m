Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 478DE9429BD
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:56:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA09722AE;
	Wed, 31 Jul 2024 10:56:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA09722AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722416201;
	bh=csOnIy/jvpspB9nK47a8ST2AMrQk4NsCoXW6553uEbo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FW0FFlxCKN4qRC4jh2rUm5gRIIbFeRvhyLEvZwgvkrOKcyxuP62bKKZilh0ZU6gHn
	 viNjMwBLeBCBo2lex8M9II5nmnLDmDegRzJkQNaDnTMDxMIcORMQ40hdErbPtQK9E5
	 RJUZTDNFjCYIar9rtNpkGpVlkRE03YjKDULSZ2N0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFD1DF8975A; Wed, 31 Jul 2024 10:50:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C0E1F89767;
	Wed, 31 Jul 2024 10:50:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE452F802DB; Wed, 31 Jul 2024 09:47:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_PBL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail.vertone.co.uk (mail.vertone.co.uk [80.229.143.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6942F800C9
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 09:44:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6942F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=vertone.co.uk header.i=@vertone.co.uk
 header.a=rsa-sha256 header.s=t header.b=IQOvIHs5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=vertone.co.uk; s=t; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wdQ6Mr33/UoTCXYa8G+anhAttrejw9E2vFQmxARDreg=; b=IQOvIHs56RH8SGflsHDCI2Y/FF
	zWuOC1n2R7Chwdo0d5EONM2p9Y6w/Fa+B9z8GNtAEOnzSUZwyghKzTJhhEg8cEci4YXdJCCLrlx/+
	6wz0Nzz1IYXE0SURmO7l+NQL3b0w6p071M9o0Dr6ZnqDp+uIStix5XLORNrbaZEVHD/w=;
Received: from jupiter.vertone.co.uk ([192.168.31.4] helo=jupiter.localnet)
	by mail.vertone.co.uk with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@vertone.co.uk>)
	id 1sZ40z-00088T-Ls; Wed, 31 Jul 2024 08:44:54 +0100
From: Terry Sanders <linux@vertone.co.uk>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>
Cc: alsa-devel@alsa-project.org
Subject: Bug in tlv320adc3101 driver
Date: Wed, 31 Jul 2024 08:44:53 +0100
Message-ID: <5652371.ZASKD2KPVS@jupiter>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-MailFrom: linux@vertone.co.uk
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KD2TM7DQZ2QJ7RIRW55RYUJPTWGKLSFF
X-Message-ID-Hash: KD2TM7DQZ2QJ7RIRW55RYUJPTWGKLSFF
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:50:41 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KD2TM7DQZ2QJ7RIRW55RYUJPTWGKLSFF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

There is a bug in the code for the tlv320adc3101 driver when setting up the D value for PLL.

The D value is set via I2C using page 0 registers 7 (MSB) and 8 (LSB).  The data sheet has the following information for the registers:

     "Page 0 / Register 7 will be updated when Page 0 / Register 8 is written immediately after Page 0 / Register 7 is written"

and:

   "Page 0 / Register 8 must be written immediately after writing to Page 0 / Register 7"

The function that implements this is adc3xxx_setup_pll() in file    soc/codecs/tlv320adc3xxx.c line 1172 - 1189. The function is shown below:

static void adc3xxx_setup_pll(struct snd_soc_component *component,
			      int div_entry)
{
	int i = div_entry;

	/* P & R values */
	snd_soc_component_write(component, ADC3XXX_PLL_PROG_PR,
				(adc3xxx_divs[i].pll_p << ADC3XXX_PLLP_SHIFT) |
				(adc3xxx_divs[i].pll_r << ADC3XXX_PLLR_SHIFT));
	/* J value */
	snd_soc_component_write(component, ADC3XXX_PLL_PROG_J,
				adc3xxx_divs[i].pll_j & ADC3XXX_PLLJ_MASK);
	/* D value */
	snd_soc_component_write(component, ADC3XXX_PLL_PROG_D_LSB,
				adc3xxx_divs[i].pll_d & ADC3XXX_PLLD_LSB_MASK);
	snd_soc_component_write(component, ADC3XXX_PLL_PROG_D_MSB,
				(adc3xxx_divs[i].pll_d >> 8) & ADC3XXX_PLLD_MSB_MASK);
}

In the function the LSB (register 8) is written first followed by the MSB (register 7). This is the wrong way around and should be swapped so that the MSB is written first.

Regards

Terry Sanders





