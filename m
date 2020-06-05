Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1621F02B4
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Jun 2020 00:03:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E38441660;
	Sat,  6 Jun 2020 00:02:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E38441660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591394606;
	bh=F1cuZ3dzo56RdjEfW6iqD1ChG7OM1Jr7mC+hansXCwI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kxRa5QEuZXHy4S1C/tZEQaYvipgoeCESSWlj+j0/0vT+3QK2XlDNuvBCftMI6n4Zl
	 0/PkYWLt+YqiTCtR9H5MgiPbC20Ktv+WBCH1Vi0BHCmevS6hpVQca1TSrWFFyOy23E
	 YZsRSCRXTO8nhYSGzDegL/rEG1gCyuh0McL1O+5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9351F80108;
	Sat,  6 Jun 2020 00:01:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD834F801ED; Sat,  6 Jun 2020 00:01:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEDEDF80140
 for <alsa-devel@alsa-project.org>; Sat,  6 Jun 2020 00:01:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEDEDF80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wctvwvbp"
Received: by mail-oi1-x244.google.com with SMTP id j189so9487198oih.10
 for <alsa-devel@alsa-project.org>; Fri, 05 Jun 2020 15:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F1cuZ3dzo56RdjEfW6iqD1ChG7OM1Jr7mC+hansXCwI=;
 b=wctvwvbpWO1A1HCjf/NHUA3VKLb5qBQsLSG6vVcEV3AWM99wCt/t8bgr2xsa6Hk7Pw
 FoUbstWwodSnAdG3c+eMacQJQvEmMP2TY2QIiwIVwBj+0OQsu24EpdyuKKSmzX6b9i/o
 loX3DhQ/9MJ7SYog2deugw3Ml2q7CcwOz8YQ9lCObg7BJt+Tpn+wPMEqHbE/Wb9tIHWV
 CygJCr4VBKseGwmlIAftZcoidaNeP7NUK6HkBoA76D0NjGAnICxM+rueoHJcEsVxx07T
 TTh/6DhSDCJv/tT3Hc2nhaal8XJTYm0Mu9AmOeRjJXT0VQ8jnm0Cb1WMvkuDiRg6anOA
 FdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F1cuZ3dzo56RdjEfW6iqD1ChG7OM1Jr7mC+hansXCwI=;
 b=OT0bf5/TD0oQd7mTUf30UvRPivPfnq82+Vz/Eg9H/NxEaxlvS95x/cTuT/P0s5zYj+
 k/uZ7BG1IKQ/dXd1G1DLVijVxVb7zkcIMX/n0XIRvRz5LYGVfbMx55qWe1vplfKq7g8q
 bZkzhthR+kpAl7a/l9M3ilCT1GKNd1xi3za+HsOgZcIcnciJrJYcLc++ExMGSMHSMtb2
 fDMFBpYhpsoDoFeYKYLK7n4Vzh7nxX0jfDsv97c5Ge/S4VeDckOb6DEkGSGWKMvyW79t
 +bEHMRc7df3SD9ZeSd4l4rELzyzOlNsiCC6EoboFEVfdbsHDPtHyaOBqRlutZKW6j0ST
 4pGA==
X-Gm-Message-State: AOAM531O6dzCCbVxDz+gXON76cFdejib4efSdR/rbpeXeT2xONKhwpwd
 S2pYKdYTowCAhaLX0EFOwK0q4VawVpMqkPdN1Uvueg==
X-Google-Smtp-Source: ABdhPJwi5IpaSvy3MP1LOrYYG2rZ0azcMzKLT8zxF9+F5mK4G2RYc0gGq16RDrvuQQ1nT4XJ8KX9okz2nfXdGIYijBc=
X-Received: by 2002:aca:48d7:: with SMTP id v206mr3279211oia.97.1591394491145; 
 Fri, 05 Jun 2020 15:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200605211925.87873-1-john.stultz@linaro.org>
 <CAGETcx_-ZknGcGJQMesLFWAwUyidK00-6bqF6ZZPbyyYtSPcew@mail.gmail.com>
In-Reply-To: <CAGETcx_-ZknGcGJQMesLFWAwUyidK00-6bqF6ZZPbyyYtSPcew@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 5 Jun 2020 15:01:20 -0700
Message-ID: <CALAqxLWRXNVTYU4m58mOjb1F2gFHLDbabpqT-BvuHK4Hw1FcdQ@mail.gmail.com>
Subject: Re: [RFC][PATCH] slimbus: core: Set fwnode for a device when setting
 of_node
To: Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>
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

On Fri, Jun 5, 2020 at 2:44 PM Saravana Kannan <saravanak@google.com> wrote:
> On Fri, Jun 5, 2020 at 2:19 PM John Stultz <john.stultz@linaro.org> wrote:
> >
> > From: Saravana Kannan <saravanak@google.com>
> >
> > When setting the of_node for a newly created device, also set the
> > fwnode. This allows fw_devlink to work for slimbus devices.
> >
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Cc: alsa-devel@alsa-project.org
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
>
> I thought Srinivas already picked this up and sent it to Greg.
> https://lore.kernel.org/lkml/20200511151334.362-1-srinivas.kandagatla@linaro.org/
>

Oh! I'm sorry, I missed that! That's great to hear!

thanks
-john
