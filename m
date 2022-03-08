Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 512184D23CA
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 23:02:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB1821891;
	Tue,  8 Mar 2022 23:02:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB1821891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646776976;
	bh=2YFUAlso81ScTmRR6MjXI+H2SiMZKyHCV5A1VZcVILo=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GtYDWtjiQ1a71fPPIPW59Hk4KV1UM5LbGw2ve6e31wjtaSyPRPvq8G6MEBUru55v5
	 o3yYE7efh9/PmwBJtS+3LIQkB7beJfA6XaM0JBfJCAT5yBx9TLcUbVGT5pFuJz6p1m
	 eJeFl8+HrOSCbpAaS5Nz6CaT98YS+gR3G+FKnk9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38672F800D2;
	Tue,  8 Mar 2022 23:01:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14C50F8026A; Tue,  8 Mar 2022 23:01:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05098F800D1
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 23:01:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05098F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="XQEB9sfn"
Received: by mail-oo1-xc2b.google.com with SMTP id
 j7-20020a4ad6c7000000b0031c690e4123so628657oot.11
 for <alsa-devel@alsa-project.org>; Tue, 08 Mar 2022 14:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2YFUAlso81ScTmRR6MjXI+H2SiMZKyHCV5A1VZcVILo=;
 b=XQEB9sfnrdlqXMY19fUuLkAAPuieF5u5eViUfU/EfxsR/rP8iGg5DeI/rZy/9pYxfM
 0cHHnmrV3J+uyKKoCAbVWiR75nMXC+Pq+vi/PC9AGY8ywxmqnk05xoxNgX3xRjfPayEz
 FEJcmxGn3d8q/qiRWE9vc8cNYLNmvqVJrUh04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2YFUAlso81ScTmRR6MjXI+H2SiMZKyHCV5A1VZcVILo=;
 b=SwWdnxG+PhuD2NbPUOZ3tdmGYqW7RHlEZ+plHn5joq7Rmrfcs6HsACoix47qkua+bM
 AABLhcW46s5PLuByXWDbENlAEYI644gNdQYcXLxvTSaSC+hmUY2F/zMtTxkjm9c7xIMk
 FnF0fdkavwKEr07OH8zmzMMFfksiGQygZrydrL7ZE+jrl2lWSaPZlRCpalq+RpikyNHf
 NbP2vc/DHQYIaRH6zH0NVsvIjp1ihjxVy6g5GwGWLyLWqpc9SdQfKtllCmeq+Yg0J7z9
 zLQE5Jb2V1O4QO4NeimS5y34OIVBCAn/KjtIuJzh0feO40SRt65DKEuH10outOXyS0K2
 JuvQ==
X-Gm-Message-State: AOAM533k8LlDFn7Bneoojt8ZMQ986RfkwoGALInYiQvctw87RL+W5I/C
 WvpL0U0+JQqBJuzSHuE3IJ3p3JxAXM2qUVdOF70nPA==
X-Google-Smtp-Source: ABdhPJwLudmQfT9/iCX0/jKfcxRx5VYbHOx1N9bswSPv/wawtVfhbRhxFMl+K2HGKpJpROtcs5YNMC/0F/P7AtNoUaY=
X-Received: by 2002:a05:6870:c0cb:b0:da:2bcc:aa09 with SMTP id
 e11-20020a056870c0cb00b000da2bccaa09mr3736377oad.63.1646776899497; Tue, 08
 Mar 2022 14:01:39 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 14:01:39 -0800
MIME-Version: 1.0
In-Reply-To: <1646316128-21082-2-git-send-email-quic_srivasam@quicinc.com>
References: <1646316128-21082-1-git-send-email-quic_srivasam@quicinc.com>
 <1646316128-21082-2-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 8 Mar 2022 14:01:38 -0800
Message-ID: <CAE-0n51FqW1B9mS=W8hSGR6MdowFjJ0wRnzaqYK8+QBJLyzfxg@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] soundwire: qcom: Add compatible name for v1.6.0
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, 
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, 
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, 
 pierre-louis.bossart@linux.intel.com, quic_plai@quicinc.com, 
 robh+dt@kernel.org, rohitkr@codeaurora.org, sanyog.r.kale@intel.com, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com, vkoul@kernel.org, 
 yung-chuan.liao@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-03-03 06:02:07)
> Update compatible string and master data information in soundwire driver
> to support v1.6.0 in lpass sc7280 based platform.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
