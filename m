Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E7A5A3EE7
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Aug 2022 19:37:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44C04210;
	Sun, 28 Aug 2022 19:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44C04210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661708236;
	bh=zk0aZVHiItxWxC0upniYjtmDuwhHEaADU5YLRrj+ZxE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WZwfyp2y2Tp+UJ2ajvrFlqGtLYe9dQJ9rCqbQS2bQzapVWheXZVwV71meqo+WUqOn
	 6Bkpkqz6ooZ3tzaG5ebzIL5L//0qraRAy35RxI1g/KZTXq2lrL2nRDtBnSJvTHwbPK
	 zbabt5s4AMPcvWFqAgd8r9Js1rlcHJ4Is39WTx+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58C04F80423;
	Sun, 28 Aug 2022 19:36:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1502EF8028D; Sun, 28 Aug 2022 19:36:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CC6DF8012A
 for <alsa-devel@alsa-project.org>; Sun, 28 Aug 2022 19:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CC6DF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZeTrYGel"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A2C37B80B18;
 Sun, 28 Aug 2022 17:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC922C433C1;
 Sun, 28 Aug 2022 17:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661708166;
 bh=zk0aZVHiItxWxC0upniYjtmDuwhHEaADU5YLRrj+ZxE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZeTrYGelgpW8o1guW26ZZlNZjQaFs6rtHOOR6aJNM3xKbHt4g4Z8R9wld8xFLxAJx
 wVIsW37alkXZzNwzXxtnnqVm3KdkFL5uqPJ+T7OmYlN8qeuBok0Nl8pX4QbCuwnxFj
 AoBhJs7DjSPN0UtcDTdcZ4zJe9Ao2G550k/r0o0dPzkntvFlR8KR3pOBbCbLnt2tdV
 1pKuSUQ+/aHfwEvTk8JWf+hfovsx12KQ/PthVLDMzvo9sImIv/vcyAQIUReNk/zj03
 AFSH6xA1No/e/MZXgBIKHjE2tljQqWtt/QmLDmI3hkTMeIpThZl/a7mc5Ycywj24Fk
 rOSWld2vCFv3Q==
Date: Sun, 28 Aug 2022 18:01:41 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: iio: Add missing
 (unevaluated|additional)Properties on child nodes
Message-ID: <20220828180050.51c3e857@jic23-huawei>
In-Reply-To: <99dfcc39-ab1b-1b24-c6b2-67de5509f5ac@linaro.org>
References: <20220823145649.3118479-2-robh@kernel.org>
 <99dfcc39-ab1b-1b24-c6b2-67de5509f5ac@linaro.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Michal Simek <michal.simek@xilinx.com>,
 Andy Gross <agross@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>, devicetree@vger.kernel.org,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>
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

On Thu, 25 Aug 2022 15:04:33 +0300
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 23/08/2022 17:56, Rob Herring wrote:
> > In order to ensure only documented properties are present, node schemas
> > must have unevaluatedProperties or additionalProperties set to false
> > (typically).
> >   
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to the togreg branch of iio.git and pushed out as testing for 0-day
to poke at it before I push out as togreg for linux-next to pick up.

Side note. Some odd entries in your cc list...  alsa-devel?

Thanks,

Jonathan

> 
> 
> Best regards,
> Krzysztof

