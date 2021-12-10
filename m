Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 353F7470C6F
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 22:19:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C473F2129;
	Fri, 10 Dec 2021 22:18:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C473F2129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639171154;
	bh=zFTRrZxrwjSy6WTK1uXahRMLBKbUD9MvWYDRCs1BryM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HKk2ypWcZEILUyCz3pEwyV26ikzNAMsgPBVMxLe0+hjHUWuTEv+yN27kGhfKhrxq/
	 93gTPvQVpX8lJP1fXOpOCS/JI6LyVu8VYS/F18TNefaK8YtOxmKbg2NRXrOmSDpC3y
	 XbIU6eNGcYQLmt2iqTmtlTZy0DLdGWuMDy6NiQq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32852F8028D;
	Fri, 10 Dec 2021 22:18:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46D5EF804EC; Fri, 10 Dec 2021 22:18:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 362EEF804E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 22:17:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 362EEF804E5
Received: by mail-oi1-f182.google.com with SMTP id bf8so14956035oib.6
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 13:17:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q0bPerVgAjvBuE/PcLA6saZylIAAwjAD+Ufdm6YbSp0=;
 b=uQ8MhGA3XTRW7nv1mpIXyDpDidTLefV4iD298DQvdO3J2bf71iuGFJX574clCh4LMR
 g1A7z6LLr+iu+wx4Jc1VjoS6psh0SbfbwolhbcmHDPT9yeFEb5AQ63x/BbSeQFm1MIqB
 FinB+u8RdS+f2DOVSX8Fa/OvX00Gf44t31nnmj4tRyNWGSHHiAqYXyyjMcE7lTXp9ICB
 mnfMgAv/T/TyCFSiuorb9njIibupm1sNBjfet4qOFz8nohhBgg5uI7CZ3uIBzDzTiXOV
 x4ib8LikgEOfOyJBAbAP/GAQZdTpnrj/kBHu0ImIVKDNCJC8lNU78zLEcNwPtarrxBUX
 Cd4Q==
X-Gm-Message-State: AOAM531zXIuzbF2MI/1SIs3w8iMtblKt7tXH86W9M2prtDlw5cjiexWV
 8aBZ3apqfT9zdXK7pal86w==
X-Google-Smtp-Source: ABdhPJz2u2x7Bu7qvex+Re/WcUxmkShg6AZtjjoYaPNtDL5dTDsqyPg1NFLveQRPAb4o7r8aYE602g==
X-Received: by 2002:a05:6808:3c6:: with SMTP id
 o6mr14779782oie.145.1639171074705; 
 Fri, 10 Dec 2021 13:17:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r26sm699244otn.15.2021.12.10.13.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 13:17:54 -0800 (PST)
Received: (nullmailer pid 1914880 invoked by uid 1000);
 Fri, 10 Dec 2021 21:17:52 -0000
Date: Fri, 10 Dec 2021 15:17:52 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: pinctrl: qcom: Add sc7280 lpass lpi
 pinctrl bindings
Message-ID: <YbPEAAeH69Q93Wm9@robh.at.kernel.org>
References: <1638891339-21806-1-git-send-email-quic_srivasam@quicinc.com>
 <1638891339-21806-3-git-send-email-quic_srivasam@quicinc.com>
 <7ae29aa1-34da-c362-5712-4b787474d7f2@linaro.org>
 <bde0c8b0-7244-1bd1-84b6-8efab4f01fa2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bde0c8b0-7244-1bd1-84b6-8efab4f01fa2@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 agross@kernel.org, swboyd@chromium.org, lgirdwood@gmail.com,
 linux-gpio@vger.kernel.org, broonie@kernel.org, rohitkr@codeaurora.org,
 bjorn.andersson@linaro.org, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
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

On Wed, Dec 08, 2021 at 03:41:25PM +0530, Srinivasa Rao Mandadapu wrote:
> 
> On 12/8/2021 2:54 PM, Srinivas Kandagatla wrote:
> Thanks froYour time Srini!!!
> > 
> > On 07/12/2021 15:35, Srinivasa Rao Mandadapu wrote:
> > > Add device tree binding Documentation details for Qualcomm SC7280
> > > LPASS LPI pinctrl driver.
> > > 
> > > Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> > > Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> > > Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> > > ---
> > 
> > 
> > I remember in my previous review that I requested you to use git mv for
> > renaming this
> Yes. Created patch with "git mv" and commit. Not sure why diff is not as
> expected.

The 'git mv' is not what matters. You need the -M option for 
git-format-patch/send-email. There's a config option you can enable that 
by default.

Rob
