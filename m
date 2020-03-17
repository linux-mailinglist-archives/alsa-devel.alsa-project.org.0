Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F310C187E9E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 11:48:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FE6C1827;
	Tue, 17 Mar 2020 11:47:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FE6C1827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584442104;
	bh=2U9frYA9hCmEDiVv4PJp9f1enEDxHiFZB97FK7oQnHY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N+w4QNYDWe2AENPkX78mKYVAuYZQkr1T23XXfb8dHwJ8umK+vsVStkPZQMksvi5dx
	 JgSJb3h4EMSjRrs1gjVMv5GDwiJmf/vkW5JiBBeyIDX5Ayek2rmursAzDu5QvTbN3d
	 xQWh+PM7sUnIm/yZaZunJDWB/UOPsZdsmGucKzfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CDD4F80058;
	Tue, 17 Mar 2020 11:46:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3959F8022B; Tue, 17 Mar 2020 11:46:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AFC6F80058
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 11:46:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AFC6F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="CbHpHEQk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lmTf0G34fR6oa2MizCTsCs41VYrjYRn/uv1OBCMzDSQ=; b=CbHpHEQksOiPR1aqVKoVtyRa6Z
 XmAKmsfshul+pWuIwp/sflktOH9efYrsr4/qDYaNybeYhYFsite/H3A3aqL0jQWvgkxFGDk/3P512
 Qw70j//9ABI57QxeauiC5WYQ5ZmLv/OZ7ZzOkBg5UyAWlxVYGJIaHCUZgazuXoFgQ2FAE2+JJp+ud
 K3xd/QY6MUcTzYYDPsiqXR3eqq3/XHBhKHjBN6vc3K1DKeubh1gkqS4IYTNV3YLG8ZEF+3p0RzFa1
 slYDAiO0QurFt0/9htq6iJFJ+kBfsKmWinscm3Lw5v4C1FGsFcz633uU2aEtORBbhPLWafqrNOWYj
 dfB8Gsig==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www381.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <lars@metafoo.de>)
 id 1jE9k1-000869-Pn; Tue, 17 Mar 2020 11:46:33 +0100
Received: from [93.104.105.202] (helo=[192.168.178.20])
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1jE9k1-000Nx2-Fi; Tue, 17 Mar 2020 11:46:33 +0100
Subject: Re: [PATCH 3/3] ASoC: rt5682: Add the descriptions for the DMIC clock
 rate and delay settings
To: Oder Chiou <oder_chiou@realtek.com>, broonie@kernel.org,
 lgirdwood@gmail.com
References: <20200317025240.10435-1-oder_chiou@realtek.com>
 <20200317025240.10435-3-oder_chiou@realtek.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <8a015115-a8e4-668b-57bf-688ca1ec9e8e@metafoo.de>
Date: Tue, 17 Mar 2020 11:46:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200317025240.10435-3-oder_chiou@realtek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.2/25753/Mon Mar 16 14:05:55 2020)
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, cychiang@google.com,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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

Hi,

On 3/17/20 3:52 AM, Oder Chiou wrote:
> The patch adds the descriptions for the DMIC clock rate and delay settings.
>
> Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
> ---
>   Documentation/devicetree/bindings/sound/rt5682.txt | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/rt5682.txt b/Documentation/devicetree/bindings/sound/rt5682.txt
> index ac98151d29e4..0fb8a37d9b55 100644
> --- a/Documentation/devicetree/bindings/sound/rt5682.txt
> +++ b/Documentation/devicetree/bindings/sound/rt5682.txt
> @@ -38,6 +38,12 @@ Optional properties:
>   - clocks : phandle and clock specifier for codec MCLK.
>   - clock-names : Clock name string for 'clocks' attribute, should be "mclk".
>   
> +- realtek,dmic-clk-rate : Set the clock rate for the requirement of the
> +  particular DMIC.
Usually for devicetree property names 'clock' is not abbreviated. So 
'realtek,dmic-clock-rate' might be a better choice. Also mention in the 
description that it is in Hz.
> +
> +- realtek,dmic-delay : Set the delay time for the requirement of the
> +  particular DMIC.

What is the unit of the delay time. Usually for properties for duration 
there is also a suffix indicating the unit. E.g. realtk,dmic-delay-ms.

- Lars

