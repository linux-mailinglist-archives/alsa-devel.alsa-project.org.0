Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0964F90122B
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2024 16:57:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6035484C;
	Sat,  8 Jun 2024 16:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6035484C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717858635;
	bh=dqPQf0sQY27ayUqdo+VIE8le+JpFdCmmdo4c64tioGU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZAA1Ls7l/RW5dtBCfcLCJfv/3Bj8uudT9yAAA4u0zUHleLgkMsPBWh4dnvQTo42aa
	 e0lDgAsmp0gz08+Pr6LygiuxKpYb/tEEa8RmMmgALz46Uq7cL04uiPD2kUMtGth5UV
	 nU+ryk3CxW4F3nwtpTUh6dB+NyYtlR9tgLX+8Nps=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63045F8058C; Sat,  8 Jun 2024 16:56:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C92D7F805A9;
	Sat,  8 Jun 2024 16:56:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D67DF804D6; Sat,  8 Jun 2024 16:56:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D311DF8010C
	for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2024 16:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D311DF8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DkOTiwLJ
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-dfafe87b5fbso1683157276.3
        for <alsa-devel@alsa-project.org>;
 Sat, 08 Jun 2024 07:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717858584; x=1718463384;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XsX3hty+D+AHRDtvdfjVtw4OVbF3WX5AC3es8JeM3yw=;
        b=DkOTiwLJnWI6jNbRuwc22yjkGEmCzFm2rR2TFldLTmi4E9z7WfFVrhiCubZyVhtLvZ
         bWXHlkxT1owDUTxf3pa6HnWxqIdUmp8AHG2mrl1B2iCjhEbj24PP6K5Qqlfw5g0GtnxV
         eK9BmveqFf/M7fV/mdzN3fgw88zSASdqyDplYJpX/VwYR0M/0BW+wH4GDRfwkKBS7Lc3
         7F3KsBS4MBKE3By2sZ1+38swiEnMeR6pPBPhM82LOz5w6GGG+oD2NCCpg/jdH1h9zqvI
         mv/XnypR+aXbOOmMT95J9SS6llLTE04cXKvmetGQQ2CJnX32vZZD4h52/5D80aq8uEvo
         g5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717858584; x=1718463384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsX3hty+D+AHRDtvdfjVtw4OVbF3WX5AC3es8JeM3yw=;
        b=cX5t3I0/2SP+KaeoXorkojtSE4dH5TuFQPAGRd6bHiVqrRPfwNCEDEIxCXOzp3AWvS
         /MIcsh+B2YB/fi2ZN4e8dnVpSHmzrGgSj61YvQBBEnh4wasZ88pHA6ULKSOM2aGuaGSZ
         fAu0ak6GbXWbOyHqtYbp4cXog8NxvsLMw4K7Q25dpFWPxJbfIjWRpA811F94N0SbU3DF
         AkxL8xtzm0ktMxchgQ0CpdUtXVtIGV4Fav0g1AbZMU0PSYRTVwMQNit8fy7WfFWDC9fl
         1cKcr3JAsLgFWD6K36Y3Zhfz9fSYHcG5un+bactwecfiKdx0rxqifqZCZ5k7YR7LH+mQ
         EMyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAB/lW6ur3dnbjPULBgCwsPZMxZjendlkUkFf1ahnZZlA+ixUAp0DiitueoB8cdLzrjnI0oUlspFTbx+PM7pX//FjSqttzxayYvm0=
X-Gm-Message-State: AOJu0Yx1Zm/3AZPIWhMlOhOKn4GILCfuwEZVKYuFrKPJZHth2boNS63+
	dmefuXhVa9lqex9B5l9FpleQd2tyKBVpQKhInjbu8En5i6BNQojhvgFMJozE9PaWq3l2D8ZxPwW
	oak+tBvwBpfkb9TZD3CFO+HnvR/HFadoLF2Pb+w==
X-Google-Smtp-Source: 
 AGHT+IGZWqZUzqNrVGDIoc1u0I2wXkZf1wtlFQPedLfZtvoKBbtfCQI3l9B9610V7doEPtEk0nqZWOyQbdZ9z8mJOeo=
X-Received: by 2002:a25:244:0:b0:dfb:14cb:f08b with SMTP id
 3f1490d57ef6-dfb14cbf21dmr846140276.23.1717858584122; Sat, 08 Jun 2024
 07:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
 <i6jwqycgywrq42u4km6pjppgvvhsbvuh7m6mzyqy2qcge32ihy@n3lrowkyouv2>
 <3ea05a12-27a8-46df-9fb3-28501404a399@linaro.org>
In-Reply-To: <3ea05a12-27a8-46df-9fb3-28501404a399@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 8 Jun 2024 17:56:13 +0300
Message-ID: 
 <CAA8EJpqMk9vujHAmF+xSKBDzR1LM9w-M7a8vxcCkXey9VpHBhA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ASoC: qcom: display port changes
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, krzk+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: DYBN5BTAH3TP5H6HK5QDACYQS2M3TZP7
X-Message-ID-Hash: DYBN5BTAH3TP5H6HK5QDACYQS2M3TZP7
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DYBN5BTAH3TP5H6HK5QDACYQS2M3TZP7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 8 Jun 2024 at 12:12, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> Thanks Dmitry for testing this out.
>
> On 08/06/2024 03:23, Dmitry Baryshkov wrote:
> > On Thu, Jun 06, 2024 at 11:49:18AM +0100, srinivas.kandagatla@linaro.org wrote:
> >> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >>
> >> This patchset adds support for.
> >>      1. parse Display Port module tokens from ASoC topology
> >>      2. add support to DP/HDMI Jack events.
> >>      3. fixes a typo in function name in sm8250
> >>
> >> Verified these patches on X13s along with changes to tplg in
> >> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
> >> and ucm changes from https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
> >>
> >> x1e80100 is verified by Krzysztof with his changes in tplg
> >>
> >> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/merge_requests/7/commits
> >>
> >> Thanks,
> >> Srini
> >>
> >
> > I have been testing this patchset on X13s, switching between speakers,
> > connected and disconnected DP output.
> >
>
> This series changed the Jack event names by removing HDMI string from it
> as suggested, did you update the UCM to reflect this?

Yes, I did. The pipewire properly reports 'unconnected' state, but
nothing stops user from selecting the unconnected device / verb.

> I have pushed changes required to
> https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
>
>
> Can you also try to  clean the asound.state restart the pipewire.
>
> > - Once the DSP got into the state, where I could not further get it to
> >    work until the reboot:
> >
> > rohan pipewire[1749]: spa.alsa: set_hw_params: Invalid argument
> > rohan pipewire[1749]: pw.node: (alsa_output.platform-sound.HiFi__hw_SC8280XPLENOVOX_1__sink-48) suspended -> error (Start error: Invalid argument)
> > rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> > rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> > rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> > rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> > rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
> > rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
> > rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to prepare Graph -22
> > rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at snd_soc_pcm_dai_prepare on WSA_CODEC_DMA_RX_0: -22
> > rohan pipewire[1749]: spa.alsa: set_hw_params: Invalid argument
> > rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> > rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> > rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> > rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> > rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
> > rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
> > rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to prepare Graph -22
> > rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at snd_soc_pcm_dai_prepare on WSA_CODEC_DMA_RX_0: -22
> > rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> > rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> > rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> > rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> > rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
> > rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
> >
> >
> > - Once in a while during startup PipeWire will try opening the
> >    incorrect DAI and then fail with:
> >
> > rohan kernel: hdmi-audio-codec hdmi-audio-codec.8.auto: ASoC: error at snd_soc_dai_hw_params on i2s-hifi: -22
> > rohan kernel: hdmi-audio-codec hdmi-audio-codec.8.auto: ASoC: error at snd_soc_dai_hw_params on i2s-hifi: -22
> >
> >    I think this happens if previously I have selected DP as an output,
> >    then closed gnome session, unplugged the cable and tried logging in
> >    again.
> >
> > Generally, it looks like even though the Jack is reporting
> > 'unplugged', sound daemon still can switch to to the disabled output
> I think this is to do with ucm changes requried for new jack name.

No. The jack (and the pipewire status) reports unconnected.

>
> > (or the audio card can be left in the stale state).  In case of DP
> > this frequently results in audio daemon or DSP failures.
> >
> > So, the DP implementation needs to be made more robust, so that if
> > DP output gets selected when the cable is unplugged, the driver will not
> > attempt to configure the DSP.
>
> I have tested this with
>
> kernel:
> https://git.codelinaro.org/srinivas.kandagatla/linux/-/tree/dp/sc8280xp-6.10-rc1?ref_type=heads
> ucm: https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
> tplg:
> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
>
>
> with the above on my x13s, I can properly do switching between dp0,dp1
> and speakers with no issues.

Have you tried switching to the unconnected sink? Starting the
pipewire when the previously selected sink is now disconnected?

>
> Can you try them?

Is the changing of the JACK names the only change in the UCM? compared
to your previous version?

I've used the following topology, fom the topology repo / x13s-dp branch

5206af2e1915b8dba52da2e59fb5ebff audioreach-tplg.bin




-- 
With best wishes
Dmitry
