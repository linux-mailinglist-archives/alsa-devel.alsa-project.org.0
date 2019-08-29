Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D638A2754
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 21:33:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 344F0820;
	Thu, 29 Aug 2019 21:32:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 344F0820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567107194;
	bh=3EYgrEMvZnzsXYXyyJNi4BToYpFwwQ5yQdXJyUJjCaM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=phY5F+D1ReFdMLMHT/JiYXfVcDp9T6Es1hQC59Ub/9nTOpEePn73RX4mUJ3Mu2rHk
	 SWV6rdMdhBZTFIEJrMGIBk1BGDLHhPuEPAmLAINMHdYGFqLNFus/O6ZuJi/H/BXDug
	 m5jyAwBxPgbtG0eDd+rtM7rA3n4TY1jHQnSwNX2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66A05F80273;
	Thu, 29 Aug 2019 21:32:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0CD8F80273; Thu, 29 Aug 2019 21:32:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FEABF80142
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 21:31:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FEABF80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hCNN9v+E"
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C292123403
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 19:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567107117;
 bh=c0TKOHtsdLnSEh9la+4SDm3KlsaHmyTiTtfSkyUPfIs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hCNN9v+EA/zeZInhJp8Dnihzgo6vQfghmvl59uaEdSrQR+PeimsL49pUMV7ECV8up
 cLfnsqkbRa2jOWmFXQ9QEpS4yS9bwwDUjHsglgxdBKLl0PAOD1O+r7t9A7EMwiya7s
 jps1UkaLmwZ9GI2OFc37hjD8SVts/sE76ybWHVlo=
Received: by mail-qk1-f182.google.com with SMTP id 4so4034741qki.6
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 12:31:57 -0700 (PDT)
X-Gm-Message-State: APjAAAWNSOrsl7NqnZnGnKWuq/Gexo+ZIjToBuWKilD+MIVKR+Gs8lNa
 KHP/G73HTFm5vuJHjrSqxvVTnE/pmOKtRuGYTA==
X-Google-Smtp-Source: APXvYqyOpevKjOl2JqIzIoObDTg6SqZCtU6dOEEUknkpmml061ROH76tm9++13JepO+XnE7NvUxRUEpL3ozPoY5XaPA=
X-Received: by 2002:a37:8905:: with SMTP id l5mr11619212qkd.152.1567107116986; 
 Thu, 29 Aug 2019 12:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190829163514.11221-1-srinivas.kandagatla@linaro.org>
 <20190829163514.11221-2-srinivas.kandagatla@linaro.org>
In-Reply-To: <20190829163514.11221-2-srinivas.kandagatla@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 29 Aug 2019 14:31:45 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+mgx903vcawSxo8DhVgXyOet1DvA4hc8DpPO02sWMOig@mail.gmail.com>
Message-ID: <CAL_Jsq+mgx903vcawSxo8DhVgXyOet1DvA4hc8DpPO02sWMOig@mail.gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, spapothi@codeaurora.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v6 1/4] dt-bindings: soundwire: add slave
	bindings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Aug 29, 2019 at 11:36 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> This patch adds bindings for Soundwire Slave devices that includes how
> SoundWire enumeration address and Link ID are used to represented in
> SoundWire slave device tree nodes.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../soundwire/soundwire-controller.yaml       | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
