Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E56C994FED9
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 09:34:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 500A422A9;
	Tue, 13 Aug 2024 09:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 500A422A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723534492;
	bh=mU38cC/LNwgzPmTxkcy7GpXw8inn9Lq9sOxBxqRIzGg=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H22BgDKQzOoAqtscuyC8PAju81yo7U5DEFhmH+fDWKsvORTcer3/IeUqvXHJBRnQg
	 aE2WqgaNE0S4VlzrvAjORhMmoCsEHYv7gSZhQnENmGY9rtYD5kL1xnXogbsaw2ie/Z
	 fkGIYvUL46qkWDNRivW+mHFrUrcOPMlf6cz89Hek=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0598AF805B5; Tue, 13 Aug 2024 09:34:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 491F9F805AE;
	Tue, 13 Aug 2024 09:34:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5523F80423; Tue, 13 Aug 2024 09:34:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 830A6F8016E;
	Tue, 13 Aug 2024 09:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 830A6F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=tebG8Yjf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1723534431; x=1724139231; i=markus.elfring@web.de;
	bh=mU38cC/LNwgzPmTxkcy7GpXw8inn9Lq9sOxBxqRIzGg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tebG8Yjftsbl3IF0TEFclqSqrb2UEraeT45CmxN6iRDtIan/tesDmlY0ypVX9H8O
	 e/VXPtLo0gGUvvklh3xJJ5nH4BemydyVfA7D2mA+30CpjczQPOxDS4x4I2nSe5U5E
	 BUh2SoKMsv+tWbvhGRTM0ixwCHh8r9aX82JMY7EOwCBJa13vt8IILY3FrfeAvuRgB
	 Io7AxlucJ27nT35u6xAKnT7J9XMxZoMRtG9H1/3p3LUXTx5orH4b6Z05I27CEuWoV
	 2KSGC2OCoVpjIRikArEvQM2kO/7ZdbzqpXCqUa30LEH8fdNw/QEdSdVQppA5Lok5O
	 rbBRADEk4ckAd0jTKw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MYu1C-1siIGd2PTM-00XyiM; Tue, 13
 Aug 2024 09:33:51 +0200
Message-ID: <fb45abbe-6cd7-430f-a828-bcf8667a87f7@web.de>
Date: Tue, 13 Aug 2024 09:33:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Basavaraj Hiregoudar <Basavaraj.Hiregoudar@amd.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sunil-kumar Dommati <Sunil-kumar.Dommati@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
References: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 1/8] ASoC: SOF: amd: Fix for incorrect acp error satus
 register offset
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QXjrDwQD05SSALKfEGxtJqBs/HinYxwdtF6/Ipy0yvvNpHL8MU/
 OdEarN41T+2waA1pWjJgs9oRbQ2lBt1rHH848rr2nxOjCjGJTVyTJuxcHqDew/UhbVt83Xz
 yDRxO0giqTxP4HfRQD58gp4tL/KPfFulVqNlztpjOUTdF+nvrMl4j3FNocmySH/lM6NIS8S
 ck/1thdaJ0wzkrVzLP3Ow==
UI-OutboundReport: notjunk:1;M01:P0:wfBjWxf42kE=;dwBdLLCOghN1zXaw0AYkTP79JET
 6I89tFsZazzv/E32KxErl2JLPCbVJYu5CQoMwx9pEahjypZapg+eWdDJJAN5Rr0YoQod84uSL
 uBMD58o6gdKtlE5SuZC9M+5OQMdgfYpXOdhw1XbJAdheXBs39hCUUL/E45sSfXC31jvmSFf0Y
 wVXLMCYgcndSea0oC7DU00qedHMTXg99wQSSlkZHIU9TkOZ3AbS0s8AZRYKA0DFQoTbFGUNgT
 SbM+S5kMdpAo0xRnfRADCaxxGwQ4LTuiWO8aqdSTf0sFxB8BICx35kSCAVwn6EU/PQ2jDbmgy
 zxgu5wziQpXfB19ZlWCE3gmC0T6tt4Y7+2Lc7UzLTnSYbUwW0mvMMLsTI7KHl1V5Xhnd9ZF4b
 UboqLulsMuumlgxOIGRTPXAfk65KzSAdvz70/210TaE/8BfQ9TIk8D9XqPOtkZkLNnLvnmy7N
 H8Mi5nK8s9FsD5qeDmzD2Q6r0Ye8er99FgXBuWclqAH4F6x8i9kAtaXMASk2CmfUZP+mg0G1/
 +fcHTBhQecy8y27LehxwnKFPG8BNgx1gh7sYtWMu2jRHadaH6hZwdT32teM0WmiCDIjcKAMAF
 YeNFvgLFnItBTMQUPo3uZsuB1NFKWVpmH//BPc6N+x5mbxq7Xfzp5mAS6gO1mGsOQmgvHWAbG
 TfEsDMId42VGX4NhT7Y0mCG/EZYSVE4zOa++ECnx/sediocyJCcuM6ne9gmnvS3VkIeDZWtld
 Ai/rGwWtR33KJYUKBYeA0WqZuO2JcD9KsrtRTTW1UuqDqMTOCbb0lE87Nb96jLmc8+TzdgjBC
 D2I7MlKhFCe/SAZ+xlvyFfUg==
Message-ID-Hash: VN67QWOK666V62EDJ7BLW4CRUEE5NMS7
X-Message-ID-Hash: VN67QWOK666V62EDJ7BLW4CRUEE5NMS7
X-MailFrom: Markus.Elfring@web.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VN67QWOK666V62EDJ7BLW4CRUEE5NMS7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> Adding 'dsp_intr_base' to ACP error status register offset in irq handle=
r
=E2=80=A6

Please avoid typos in the summary phrase.

Regards,
Markus
