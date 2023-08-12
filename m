Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 447C1779C78
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 04:02:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9159D83B;
	Sat, 12 Aug 2023 04:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9159D83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691805776;
	bh=gZu3VCSXksAlch1l/Nn0DJCrwCclu/WcPo7SWLglZjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gfGG4wUfE56Tqw789V8WwAsTQ9wiyqJjhR33S6rjntrA6jqsjig9P++zprhhnN51C
	 45SpQbvy240lbyvpTYGfVX+HENvIZpgtk8RwFAn/meynoU6xjUzgpgB+0CiayIcN6P
	 ah0Yi05wQfGcLXGalnAwU19URMvv7j1dTr11MciU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14CE6F8016E; Sat, 12 Aug 2023 04:02:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB690F801EB;
	Sat, 12 Aug 2023 04:02:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1541FF80552; Sat, 12 Aug 2023 04:01:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F058F80536
	for <alsa-devel@alsa-project.org>; Sat, 12 Aug 2023 04:01:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F058F80536
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MYnrczVW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C96B964AAA;
	Sat, 12 Aug 2023 02:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F281C433C9;
	Sat, 12 Aug 2023 02:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691805714;
	bh=gZu3VCSXksAlch1l/Nn0DJCrwCclu/WcPo7SWLglZjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MYnrczVWhJ2d3+KS8jq0tJikwcuABKb3B8elSyBtYo+RjU4S7lcxHcY8f25FFTuIz
	 4nzw3uz0jXEkrwCrP9BAsFST9iwQbOm3ihbV1hKmGCgwEz5CpEX25EOcF+dT+lb9K4
	 RvUx3XN4YT8ehHu46Tz34oc4Mi5OYC871n9AuWThQCgQSwFqWJ9+NgZ8yU37SCJRKE
	 /kZLdJ4IB7JdgiIxpa/7y0akjg/727pG11zmNbSrbOvgcW0FFLKKD0xdgJBHXCm/4I
	 fM7dBtPSKOeyUavvdyAxipMSudWR71m2tLi1vRVDtUYe2h9U4TR2op20K+ykTkNX99
	 DMdsl1XGYh6Eg==
Date: Sat, 12 Aug 2023 10:01:38 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, kernel@puri.sm,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	David Heidelberg <david@ixit.cz>, Sherry Sun <sherry.sun@nxp.com>
Subject: Re: [PATCH v2 4/4] arm64: defconfig: Enable Redpine 91X wlan driver
Message-ID: <20230812020138.GJ151430@dragon>
References: <cover.1691684726.git.agx@sigxcpu.org>
 <ba8bc68cbe17224eafc84fc3fcad5a2522d3d97c.1691684726.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <ba8bc68cbe17224eafc84fc3fcad5a2522d3d97c.1691684726.git.agx@sigxcpu.org>
Message-ID-Hash: O5VIPXYJRYYBD3H4YN2GU6T6IJZWXKJO
X-Message-ID-Hash: O5VIPXYJRYYBD3H4YN2GU6T6IJZWXKJO
X-MailFrom: shawnguo@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O5VIPXYJRYYBD3H4YN2GU6T6IJZWXKJO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 10, 2023 at 07:59:52PM +0200, Guido Günther wrote:
> The Librem 5 and it's devkit have it connected via SDIO.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>

Applied, thanks!
