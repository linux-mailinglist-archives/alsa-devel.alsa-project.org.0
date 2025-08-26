Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B438BB358F4
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Aug 2025 11:31:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1C536023B;
	Tue, 26 Aug 2025 11:31:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1C536023B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756200685;
	bh=OvUbIz95K4JXfdcPlfARC+AizRB3XJUiuZwikQ+/j1E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ju4Ilfe0b6FuojujoQ11oQSsRW4ja0GuyIPmxkWcAx1qepVQrjjL1B4vn38tthC9F
	 5uCN1M751+VsS2XLDHnODCODVhSgZuCJlXyuihrSbrDZDovlXpLUx01aTEJSHMcx1H
	 rwVfaBgOSjwGzGY4IOlOCp6toUnvxpRCicLDPvh0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3ECDF80557; Tue, 26 Aug 2025 11:30:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E50F2F805C9;
	Tue, 26 Aug 2025 11:30:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DCA4F8051F; Tue, 26 Aug 2025 11:30:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76773F80153
	for <alsa-devel@alsa-project.org>; Tue, 26 Aug 2025 11:30:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76773F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=gd0t2ESI
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-70dbe6b8142so25744426d6.2
        for <alsa-devel@alsa-project.org>;
 Tue, 26 Aug 2025 02:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756200623; x=1756805423;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvUbIz95K4JXfdcPlfARC+AizRB3XJUiuZwikQ+/j1E=;
        b=gd0t2ESIC912ML+ecWkNA+yqWdYKbTYN+ohcxNFSI3rMf/gstHS69+TPeloN0iqDgI
         R29KThLmFa7sbWZPM9yLUZr5KcxpSBDx/tdyjud93tL0LdzfVglHzJg/o9HtNFFd+SQX
         KBtH2fKBajvhzvjE//8ObnZ7K5oy78Ift8gmHNkG8Kts1UelSwHcZkddzVL6O4VMVz7r
         dwPYGdOfTH1aCRBaxEi/txcrlYxi5yGNm0J+lpt7cBE4dS9Ll5j0EeJb3C836ZNfFGW5
         dUBd7MYq8aQmooz/Pl9MeZjwupRL0J2TuBaUDK/uZwWhVqQXi59mwneqKFAg/rZUUO1D
         +7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200623; x=1756805423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvUbIz95K4JXfdcPlfARC+AizRB3XJUiuZwikQ+/j1E=;
        b=n6gSmuUo6ru9Xhr/Ub0ekmQK/ARBnzmHsKsOIHM7fFKYTk9unzfZ26jwjRPA+xfBPl
         raefcLcvWgRWQNq+yoDiwFKNxDBdr8mYZIyaHwct4yl6ZNVkU7AZNeacGGr/NyC2VDG3
         GmLY67CwvVIsxLg/bg5Dl1E7VlHrRJqOW8ANX3QfAjFSA2CHm9gYqRJAQQVvLnUCg5lg
         SW37F1ngmbZgFMaXw8agtS7LWeSxupvpuL9hOe0hITzhtnF9gtjt2OrCABoCDNi3jBVQ
         we/NwdeLByqw2jtXtiHyYYxn+do0cKmnPHJTtt5LKY4kf3+xwh4JODZQs3OPXXO3jfCU
         v+IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFjzVDRiWnOjlK4l7+wsrUmSaUbTpVDQUZ7ys/D/uQhkrH1pIiRtR6UABoyTlIxdi+11SLd4zxbIkT@alsa-project.org
X-Gm-Message-State: AOJu0YytqzvJycuMoA2d+YYBndd9Xk1fvt5baf3Z71gKoihCJrDySBf2
	TT98MIVk8H8bvoNSU80tqQLbNs4Qft+S6c6Dh8c0X03opz0VxCUy1BATGGhUpS3DWyhh97MH6m4
	WyENR27kVp8oJWqwnLzLFGDd65+KyPCS65kpWYEJz8g==
X-Gm-Gg: ASbGncsIsXmcWico2z94UCU79Ha4qFd8xZGbuWHcu7ExUXEPPrmP+e+nj1DQypFjQmV
	ZWWpNrBs4aRodY8CMSuJ+Y+L/kJFndH9QnctSfpGAiAavjkX0dFI2DJfeGGnCr71CY25sYuMjz0
	feGxbcJZEC9+CPo9QZoG/IopSD/BtIlSCvZDqITPRJVpRf5qiJDDbJgpURkB8uN9jsahAu0Pzyu
	X3tBxU=
X-Google-Smtp-Source: 
 AGHT+IGmb6aCsOOpnEHv9Gpndnk4Vjl+wnb5OY915aQJlI5lgdEYqe5G/1E/Dq637FnnVD91zJaENT6TRFh3PTA48B0=
X-Received: by 2002:a05:6214:2526:b0:70d:b80b:70c0 with SMTP id
 6a1803df08f44-70db80b8896mr80009216d6.51.1756200623362; Tue, 26 Aug 2025
 02:30:23 -0700 (PDT)
MIME-Version: 1.0
References: 
 <20250826090530.2409509-1-ajye_huang@compal.corp-partner.google.com>
 <431d4cbf-281a-4f93-bda4-767fa6b96c8c@linux.intel.com>
In-Reply-To: <431d4cbf-281a-4f93-bda4-767fa6b96c8c@linux.intel.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Tue, 26 Aug 2025 17:30:12 +0800
X-Gm-Features: Ac12FXxSXegTC0bZL7M87CxHLjg5Y4MEinlMDORv0H8fnA3ehnPv_o-ljoNpdTU
Message-ID: 
 <CALprXBaatmypSp=AUDjxYec87XRtnEE3vDc-VKsULPA2W5135w@mail.gmail.com>
Subject: Re: [PATCH v1] ASoC: SOF: Intel: WCL: Add the sdw_process_wakeen op
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Mac Chiang <mac.chiang@intel.com>, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: B2TAH2AMYZOW4FYNWDPU75QSOYMALPFC
X-Message-ID-Hash: B2TAH2AMYZOW4FYNWDPU75QSOYMALPFC
X-MailFrom: ajye_huang@compal.corp-partner.google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B2TAH2AMYZOW4FYNWDPU75QSOYMALPFC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 26, 2025 at 5:11=E2=80=AFPM P=C3=A9ter Ujfalusi
<peter.ujfalusi@linux.intel.com> wrote:

> Can you add these tags and send v2?
> Fixes: 6b04629ae97a ("ASoC: SOF: Intel: add initial support for WCL")
> Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>
> Thank you!
>
Sure, I will follow it. thank you
