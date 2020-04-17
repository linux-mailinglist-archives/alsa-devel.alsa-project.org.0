Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CAE1ADDFC
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 15:04:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19C081665;
	Fri, 17 Apr 2020 15:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19C081665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587128640;
	bh=ZNM0F2BEyjO++4QKmYQ7MoBVyDjcZvyTDzqeCYBTvDU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Un0LI338NuMimBvg6yPFHsJ4jyQz95dQewBzHNnbKIYvdPfngxL5wKQaJr9Gspc9L
	 vcXcbM6WhwZQwTACceMxBg2jJlko40LyjQpJ1GJd07DjHuLddWELX7U2NdpW5Uu/7v
	 kAUYMwpvEBcvDcZemHbOFVkWVGJQwPBOYNUi+6hY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 394C5F8025F;
	Fri, 17 Apr 2020 15:02:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 260C1F80245; Fri, 17 Apr 2020 15:02:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DEAFF800DE
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 15:02:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DEAFF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="O+bAnw7x"
Received: by mail-wr1-x444.google.com with SMTP id d17so2919388wrg.11
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 06:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tKr5OOcjl0LO68mRyxecrrNTWQR/Owq8GYegVeXuvus=;
 b=O+bAnw7xBiFyHQ+4Yy6M5I/WsxAkjOE4W2T/ce3IT+o6ja4IAoOJ/Mj5srEAQt68ks
 C7JUm6iMOzKPhRmt2J8n+0nXb+c7X6H4QgOBrqIlEpeFR4mfxSC5ggd/U6WkkVUdFkeM
 v8H8S5IE+Mlm61nDb6N9ITl/b7N1TT8ntXtfIzSo3/Axx/Kf8EZTv6qFrfgjKi/n9F1i
 PN5NBG80Fpm1kVTOCmDy4A7XSbcnoVeeAeT7vf8nGkUGWOuaNgWo5HV9R43tpY8nF+UH
 +2C+ZMXYaHBaA9ozNQBuzH8EEv7odocyLGT7Zc6tQINnBx4jOm6O7oWS3jeAtC8Yc5qF
 18Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tKr5OOcjl0LO68mRyxecrrNTWQR/Owq8GYegVeXuvus=;
 b=fMyexHgmaeBeA73sF34vVhVAzVk+SWr1tLm60f94vmiWX3jQu22enOr/Eg0XP7Ha1z
 dl+Ab4ZXtpDJz0Kk41OlNvwCmI88i1JW3evZVYntmfBdVb9jkBcjhYvjPX7eEN5MgyFi
 SyD5GP8hVTAB9J8IQVLEQ5dn1TxThqNydtd2lxUW/aBy+jWyJ9ZksA3ehVvTlLREHuXd
 2Aq+zpi00EIHGwrHkUZVCRuPHuF1A9QCufS+vJu8ppmcpAfUrEEK+7AJufrRXPX5w/Y/
 dp5kvkdwQzOZx75YC/ll2F9taSKKmxl5d40j+9fMr5NMsG8DaJSJa3rtlcCkZ7Sx1y+m
 vlLw==
X-Gm-Message-State: AGi0PuYdULYyF0SmapF7aeLzi2PkGQ0J039szRVBtiLu4dQFAhMZVcsB
 5RzZlop299tnP+divBa35el6Sw==
X-Google-Smtp-Source: APiQypJBuSAZYvxAVQIO84/B+i7vKU+95qK+SXe7jAj7u1BX40jmGRvSljGRre8Q319UXVQ+vH92Rg==
X-Received: by 2002:a5d:4645:: with SMTP id j5mr3720160wrs.282.1587128530156; 
 Fri, 17 Apr 2020 06:02:10 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id x18sm7460766wmi.29.2020.04.17.06.02.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Apr 2020 06:02:09 -0700 (PDT)
Subject: Re: [PATCH 0/2] ASoC: qdsp6: fix default FE dais and routings.
To: Stephan Gerhold <stephan@gerhold.net>
References: <20200311180422.28363-1-srinivas.kandagatla@linaro.org>
 <20200417112455.GA7558@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <03d0d14c-d52c-460b-0232-184156f62eb7@linaro.org>
Date: Fri, 17 Apr 2020 14:02:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200417112455.GA7558@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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



On 17/04/2020 12:24, Stephan Gerhold wrote:
> Hi Srini,
> 
> On Wed, Mar 11, 2020 at 06:04:20PM +0000, Srinivas Kandagatla wrote:
>> QDSP6 Frontend dais can be configured to work in rx or tx or both rx/tx mode,
>> however the default routing do not honour this DT configuration making sound
>> card fail to probe. FE dais are also not fully honouring device tree configuration.
>> Fix both of them.
>>
> 
> I discovered this patch set when QDSP6 audio stopped working after
> upgrading to Linux 5.7-rc1. As far as I understand, device tree bindings
> should attempt to be backwards compatible wherever possible.
> This isn't the case here, although this is not the reason for my mail.
> (I don't mind updating my device tree, especially since it is not
> upstream yet...)
> 
> I have a general question about the design here.
> 
> I understand the original motivation for this patch set: Attempting to
> configure a TX/RX-only DAI was not possible due to the default routing.
> In my opinion this is only relevant for the compressed DAI case.
> 
> If we ignore the compressed DAIs for a moment (which can be
> unidirectional only), I think we shouldn't care how userspace uses the
> available FE/MultiMedia DAIs. We have this huge routing matrix in q6routing,
> with 800+ mixers that can be configured in any way possible from userspace.
> 
> In "ASoC: qdsp6: q6asm-dai: only enable dais from device tree" you mention:
> 
>> This can lead to un-necessary dais in the system which will never be
>> used. So honour whats specfied in device tree.
> 
> but IMO the FE DAIs are a negligible overhead compared to the routing
> matrix and the many BE DAIs that are really never going to be used
> (because nothing is physically connected to the ports).

Two things, one unnecessary mixers, second thing is we need to know how 
many FE dais are in the system, which should be derived from the number 
of dai child nodes. These can potentially be SoC specific or firmware 
specific.

My plan is to cleanup the BE DAIs as well!, any patches welcome!

> 
> Even if you restrict FE DAIs to RX/TX only, or disable them entirely,

I think this is mistake from myside. Alteast according to bindings 
direction property is only "Required for Compress offload dais", code 
should have explicitly ignored it. Here is change that should fix it.

--------------------------->cut<---------------------------------
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c 
b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 125af00bba53..31f46b25978e 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1067,6 +1067,11 @@ static int of_q6asm_parse_dai_data(struct device 
*dev,
                 dai_drv = &pdata->dais[idx++];
                 *dai_drv = q6asm_fe_dais_template[id];

+               if (of_property_read_bool(node, "is-compress-dai"))
+                       dai_drv->compress_new = snd_soc_new_compress;
+               else
+                       continue;
+
                 ret = of_property_read_u32(node, "direction", &dir);
                 if (ret)
                         continue;
@@ -1076,8 +1081,6 @@ static int of_q6asm_parse_dai_data(struct device *dev,
                 else if (dir == Q6ASM_DAI_TX)
                         dai_drv->playback = empty_stream;

-               if (of_property_read_bool(node, "is-compress-dai"))
-                       dai_drv->compress_new = snd_soc_new_compress;
         }

         return 0;

--------------------------->cut<---------------------------------

Thanks,
srini

> all the routing mixers still exist for them. They will just result in
> configurations that are not usable in any way. IMO the only thing we
> gain by restricting the FE DAIs is that the available mixers no longer
> match possible configurations.
> 
> Before this patch set I used a slightly different approach in my device
> tree for MSM8916: I kept all FE DAIs bi-directional, and added DAI links
> for all of them. This means that I actually had 8 bi-directional PCM
> devices in userspace.
> 
> I didn't use all of them - my ALSA UCM configuration only uses
> MultiMedia1 for playback and MultiMedia2 for capture.
> However, some other userspace (let's say Android) could have chosen
> different FE DAIs for whatever reason. We have the overhead for the
> routing matrix anyway, so we might as well expose it in my opinion.
> 
> My question is: In what way are the FE DAIs really board-specific?
> 
> If we expose only some FE DAIs with intended usage per board,
> e.g. MultiMedia1 for HDMI, MultiMedia2 for slimbus playback,
>       MultiMedia3 for slimbus capture,
> I could almost argue that we don't need DPCM at all.
> The FE DAIs are always going to be used for the same backend anyway.
> 
> This is a bit exaggerated - for example if you have a single compress
> DAI per board you probably intend to use it for both HDMI/slimbus.
> But this is the feeling I get if we configure the FE DAIs separately
> for each board.
> 
> I wonder if we should leave configuration of the FE DAIs up to userspace
> (e.g. ALSA UCM), and expose the same full set of FE DAIs for each board.
> 
> I think this is mostly a matter of convention for configuring FE DAIs
> in the device tree - I have some ideas how to make that work
> with the existing device tree bindings and for compressed DAIs.
> But this mail is already long enough as-is. ;)
> 
> I also don't mind if we keep everything as-is
> - I just wanted to share what I have been thinking about.
> 
> What do you think?
> 
> Thanks for reading! ;)
> Stephan
> 
>> Originally  issue was reported by Vinod Koul
>>
>> Srinivas Kandagatla (2):
>>    ASoC: qdsp6: q6asm-dai: only enable dais from device tree
>>    ASoC: qdsp6: q6routing: remove default routing
>>
>>   sound/soc/qcom/qdsp6/q6asm-dai.c | 30 +++++++++++++++++++++++-------
>>   sound/soc/qcom/qdsp6/q6routing.c | 19 -------------------
>>   2 files changed, 23 insertions(+), 26 deletions(-)
>>
>> -- 
>> 2.21.0
>>
