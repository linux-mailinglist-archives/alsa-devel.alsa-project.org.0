Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A58902831
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2024 20:02:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDD6C851;
	Mon, 10 Jun 2024 20:01:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDD6C851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718042524;
	bh=Fa1MW02xtYNxpyq3hVxOyrhFI0x0nuzPDJiQWvaIXOM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HOP5evfWW8xn6LWHF7xIwwLhXCAWcvF8lRMf93FyLEnOdSCN4nNqusGiu63p/ILX7
	 8iEorMIrW4scMoNOVTwdYGPmUobUxsAir1S42ahYVKbwAQz3VxBZpQLGxN6dFY7mVP
	 B3znfNT2aYepfHX2pTwN0+i+o1E+pxy4J9QE+9yc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0100DF805B2; Mon, 10 Jun 2024 20:01:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63591F80589;
	Mon, 10 Jun 2024 20:01:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB19DF8057A; Mon, 10 Jun 2024 20:01:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D0A9F80448
	for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2024 20:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D0A9F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SwZeJe7L
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-627f3265898so49409927b3.3
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Jun 2024 11:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718042475; x=1718647275;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/0KaDHM8PScqCd7K0oCuZ7GctWWLIl5bTkF49b4ZqfE=;
        b=SwZeJe7LV5azBDTH44snjIq3ru7H/bYm3lirTx+00vymr031nr3euSDp4wZfB3Ywzv
         Tamz2vtg4L96+padrERUXSSwWAvx3p5+nQk8V1QADV/BRVitS+W3yyosU719kv68YZWc
         DxFzXsETAaet7HFmklKLBXV/CoPVi1NchLU1b8phOTe8o3eYUFyIKhnlCjb92VioeC/8
         pJ3j/bRp1LEdEqxto/w7c6y2yTng0xiXP+622CnbVsmLr4BsUs/WqiKy3SCACv1oIEeW
         Xb3c5JgpP6oW+lti4diHnWgaSmN6OeYgju3ITt7PAeZgr/lybKMuiwcfa1rQB+SSCBhM
         j47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718042475; x=1718647275;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0KaDHM8PScqCd7K0oCuZ7GctWWLIl5bTkF49b4ZqfE=;
        b=HKuYcjWMybQ6fX2NL7/HveGtIUs9J8Pjf6XywCSxiMCoGsMbsUOfB7zdBTik2lbkDV
         zhttcPjWfCzdaUsSkSul1tOtE68p9EjLSaAe5ehXWr7kbEQRG2PcBCp3rcMDDqkcSnQO
         ZMnWVSP98OM/GvR8a9DMu5EbfETkc6/kWnR6ssfjUaC51EZqM68v8kKYUzuwSxBFiued
         K2W0qcfd/gBFkXWKxiYn0EItMa5yGZh0LwPfSML8lwMO/yZcoUsZA8SEaftnsyjXQks/
         uS0QGg2qwqEUdWaHaRsM1LqlvDhVfaFy+7LIFKMjN0Ns3mATC1RorKo0FU14AT/fVf54
         +euA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAF8YJ8kmmA+Pv0mP2ZhoRokv7ouBtTxk+SsJquXY2FpDtg3I7ePlzpWk7/0ocfL8QdgH5mlMhiQQnHTzXl9X/5HqNcVkvt+Cx8Uk=
X-Gm-Message-State: AOJu0YwsgTuwmnRcpzdjjAibwnzpD4zYmKFUR2hm1Lb2ZTmwGo54A5rJ
	ofFIuYWUy5DazF/PQjYekfdL6REgo2CRBxyZcWrV4L3S0APxXfRk2B9IpG8PtJwsLMTDGhj3TCr
	HAHN4ghZgpBnnSBpz8xMpZZWvf5UQMGFOvoX9Yg==
X-Google-Smtp-Source: 
 AGHT+IGViW9iwGdwl2ZOTouNSxtXASXUQ9Auy/K59++s+dLeYurbqnkMaU1cmD3YrwP3c4bfis5CyRo+xKEEFbsSK1k=
X-Received: by 2002:a81:e50e:0:b0:607:d285:4d7a with SMTP id
 00721157ae682-62cd5667e5fmr87990297b3.52.1718042473872; Mon, 10 Jun 2024
 11:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
 <i6jwqycgywrq42u4km6pjppgvvhsbvuh7m6mzyqy2qcge32ihy@n3lrowkyouv2>
 <3ea05a12-27a8-46df-9fb3-28501404a399@linaro.org>
 <CAA8EJpqMk9vujHAmF+xSKBDzR1LM9w-M7a8vxcCkXey9VpHBhA@mail.gmail.com>
 <ab5c2a6d-6819-48eb-a3c5-178fa37204bb@linaro.org>
In-Reply-To: <ab5c2a6d-6819-48eb-a3c5-178fa37204bb@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 10 Jun 2024 21:01:01 +0300
Message-ID: 
 <CAA8EJpq6tqO6chKASKWUtfq_9vt2tQp7eH1XJY3OaVnAahkwwQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ASoC: qcom: display port changes
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, krzk+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: SW5BUABSB362BMTMPA2FD7SP4CN7AQE7
X-Message-ID-Hash: SW5BUABSB362BMTMPA2FD7SP4CN7AQE7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SW5BUABSB362BMTMPA2FD7SP4CN7AQE7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 10 Jun 2024 at 18:36, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 08/06/2024 15:56, Dmitry Baryshkov wrote:
> > On Sat, 8 Jun 2024 at 12:12, Srinivas Kandagatla
> > <srinivas.kandagatla@linaro.org> wrote:
> >>
> >> Thanks Dmitry for testing this out.
> >>
> >> On 08/06/2024 03:23, Dmitry Baryshkov wrote:
> >>> On Thu, Jun 06, 2024 at 11:49:18AM +0100, srinivas.kandagatla@linaro.org wrote:
> >>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >>>>
> >>>> This patchset adds support for.
> >>>>       1. parse Display Port module tokens from ASoC topology
> >>>>       2. add support to DP/HDMI Jack events.
> >>>>       3. fixes a typo in function name in sm8250
> >>>>
> >>>> Verified these patches on X13s along with changes to tplg in
> >>>> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
> >>>> and ucm changes from https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
> >>>>
> >>>> x1e80100 is verified by Krzysztof with his changes in tplg
> >>>>
> >>>> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/merge_requests/7/commits
> >>>>
> >>>> Thanks,
> >>>> Srini
> >>>>
> >>>
> >>> I have been testing this patchset on X13s, switching between speakers,
> >>> connected and disconnected DP output.
> >>>
> >>
> >> This series changed the Jack event names by removing HDMI string from it
> >> as suggested, did you update the UCM to reflect this?
> >
> > Yes, I did. The pipewire properly reports 'unconnected' state, but
> > nothing stops user from selecting the unconnected device / verb.
>
> No, the jack events should prevent that from happening. You should not
> see them in output devices in settings->Sound.

No. With PulseAudio and with PipeWire unconnected devices are still
visible. They are annotated as (unconnected), but it's still possible
to select them.

Anyway, even if the sound daemon were to forbid that (or to hide these
devices), it would be perfectly possible to select them via alsaucm,
not to mention the amixer.

>
>
> >
> >> I have pushed changes required to
> >> https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
> >>
> ...
>
> >> kernel:
> >> https://git.codelinaro.org/srinivas.kandagatla/linux/-/tree/dp/sc8280xp-6.10-rc1?ref_type=heads
> >> ucm: https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
> >> tplg:
> >> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
> >>
> >>
> >> with the above on my x13s, I can properly do switching between dp0,dp1
> >> and speakers with no issues.
> >
> > Have you tried switching to the unconnected sink? Starting the
> > pipewire when the previously selected sink is now disconnected?
> >
> >>
> >> Can you try them?
> >
> > Is the changing of the JACK names the only change in the UCM? compared
> > to your previous version?
>
> Yes.
>

Then consider it tested with your patches (I did fix the jack names).

-- 
With best wishes
Dmitry
