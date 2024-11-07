Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2389C1151
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2024 22:53:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1B1F14E1;
	Thu,  7 Nov 2024 22:52:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1B1F14E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731016386;
	bh=wSfUGIR63ir+DpqRwf9z1fSRhrUzDgrtDr7l6TxiiTU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L2Vg1xeyqDaOj2pAJWGLvHliEl0TPYg1ODYzNNQ29ihEjueAyRLHSltgbkSswFk3R
	 D7qRbquBsQft9m1dwH978IXWdT9oXsvAw71ktRbaP/B7dV9fFG7fxyfb/Xwi9qvsML
	 MK7eYb1ITXyg/6ZJpcJmAaMHfBk2wOBLxEPaQLY0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B03E9F805BE; Thu,  7 Nov 2024 22:52:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F285F805B3;
	Thu,  7 Nov 2024 22:52:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC03AF8013D; Thu,  7 Nov 2024 22:52:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B26EF800C8
	for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2024 22:52:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B26EF800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YH2EdexX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5EAE0A444EA;
	Thu,  7 Nov 2024 21:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B546CC4CECC;
	Thu,  7 Nov 2024 21:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731016338;
	bh=wSfUGIR63ir+DpqRwf9z1fSRhrUzDgrtDr7l6TxiiTU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YH2EdexX3KvdkaJuasETWrxZJrzJsauhEYBdAoaVi5Vm5WUBGV+efceHhgDHPaiAp
	 3UPHpiZqTJ9JRaaKqe/uINtvLoshWcCyKenJWuhtLk7qIx8pjM9sdnW0ZZisDqbciQ
	 Uan9oGdSiAAG7ukVbG3/7sMkNCjlg1Jof/9XE4RjYbPrvfggcmzg05zYuYlrjS/wiI
	 A7+TH7s7AlB43qVvKT6G7aTvnnUCcDfl2bnE2u0Kxd/tPt6ytmzv4fh4TiHo8ilciT
	 CM4KHTfMHE5B3LbMdR201Rn53XPMlsSL29jSS0YNm6IpphEEaLgDhXlsHg8qeoOXbe
	 TD+gLwCDcWnrw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Ki-Seok Jo <kiseok.jo@irondevice.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: 
 <SL2P216MB23377A60BEC4396ADFA78A6A8C512@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
References: <20241104-irondevice-sma1307-v3-0-4bbe79895f54@irondevice.com>
 <20241104-irondevice-sma1307-v3-1-4bbe79895f54@irondevice.com>
 <SL2P216MB23377A60BEC4396ADFA78A6A8C512@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: irondevice,sma1307: Add
 initial DT binding
Message-Id: <173101633645.271800.734453630790415201.b4-ty@kernel.org>
Date: Thu, 07 Nov 2024 21:52:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: GFA4JIISCUCQBXTBPQJ5GHMWNWD5XMX2
X-Message-ID-Hash: GFA4JIISCUCQBXTBPQJ5GHMWNWD5XMX2
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GFA4JIISCUCQBXTBPQJ5GHMWNWD5XMX2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 04 Nov 2024 07:33:47 +0000, Ki-Seok Jo wrote:
> This adds the schema binding for the Iron Device SMA1307 Amp
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: irondevice,sma1307: Add initial DT binding
      (no commit info)
[2/2] ASoC: sma1307: Add driver for Iron Device SMA1307
      commit: 576c57e6b4c1d734bcb7cc33dde9a99a9383b520

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

