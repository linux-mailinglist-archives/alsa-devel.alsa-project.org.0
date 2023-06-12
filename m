Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A84972CC89
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 19:27:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4F34825;
	Mon, 12 Jun 2023 19:27:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4F34825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686590878;
	bh=VUk6jAV2ZmWBvmJdiUOnmOQgHuM9loH0DtxACEg8dHo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=h9Q5aS83zj+krOfSfTvX5aSuOuGUvbQwE4TH6HpSmWnGHzvbGMSlpTeW0CRM+khkq
	 e7loStBJ85jD55PqZvr91Yp0IXe27QnoZ6ER8x8lKowNoc+tT/dv91LSwMSPDLDdfF
	 EuIcnRDppBO/GnITBSgMWIJvBDKrkBxrFwkTCvdk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FA87F80533; Mon, 12 Jun 2023 19:27:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4D22F80132;
	Mon, 12 Jun 2023 19:27:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6964AF80155; Mon, 12 Jun 2023 19:27:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48590F80130
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 19:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48590F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HfhcEvn0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A074C62C20;
	Mon, 12 Jun 2023 17:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94AC2C4339B;
	Mon, 12 Jun 2023 17:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686590818;
	bh=VUk6jAV2ZmWBvmJdiUOnmOQgHuM9loH0DtxACEg8dHo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=HfhcEvn06g9KDXJodkGT35AKIvXxDFE6+LTTf2dmZ3rsDZ6Coy6/xrgv/NnljQpXE
	 jjN4cx1wW6MaKRMjjNKkZj2aKkJvcI0yM6fDzqu9vMu5Q3C2jv3by8Veo0HT1gsTZx
	 twysmZi1dcLKfdB2ux4z5xsnNJrHoEonam1U98zbKE7KPVWtPzOgnSfQ6NEvSsOjsu
	 7lpMGpzRQf1NMj2iOjge55Zr5eo7TIWY2PXbx+eHtdB256+LPt8wgJJrqbX/DmETsi
	 JLTa1odyMSdiqffkGArngboKXqOB8TKB1gRfTPozQCrSwIk4AZwqTdMPqDxU0vJh3/
	 IexXsC9ttKhiQ==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230609140658.64557-1-krzysztof.kozlowski@linaro.org>
References: <20230609140658.64557-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: cirrus,cs35l45: drop unneeded
 quotes
Message-Id: <168659081532.87413.3101629850429696766.b4-ty@kernel.org>
Date: Mon, 12 Jun 2023 18:26:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: 74X4SCITO6X45PCHUECCU7JU7RQ7FDZZ
X-Message-ID-Hash: 74X4SCITO6X45PCHUECCU7JU7RQ7FDZZ
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/74X4SCITO6X45PCHUECCU7JU7RQ7FDZZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 09 Jun 2023 16:06:58 +0200, Krzysztof Kozlowski wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: cirrus,cs35l45: drop unneeded quotes
      commit: 374b54532b1c94076799518cad5c33536eaf0c1b

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

