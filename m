Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCE923C645
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 08:57:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E010839;
	Wed,  5 Aug 2020 08:56:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E010839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596610642;
	bh=jMYVOjqaYrOwn8Z3P+uJ7+3CixuSe8b/ighwG2pHXnA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FkAJPDYP6lS6S99UbfDZQErel/AJhOcioBv3xFA56+2VIHXWFNfhyaRL8IpuMaBU1
	 bQ9XGczd/OWY6VYn/9n21UjQIpzEJuGTiZqDgKzCnpkOcStZAOq2P88eOBaQS9ApRN
	 P+QTsJMrOAKme5NRu9qMBjwRxJ7OeMMotrjrJOIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BB10F80234;
	Wed,  5 Aug 2020 08:55:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57A9CF80218; Wed,  5 Aug 2020 08:55:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30FBBF80112
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 08:55:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30FBBF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eB7I0ztJ"
Received: by mail-pj1-x1042.google.com with SMTP id d4so3765981pjx.5
 for <alsa-devel@alsa-project.org>; Tue, 04 Aug 2020 23:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SGZKUpYTKCkpMjR2/gp6H6g/7u9i9ZZGE+6qybYiQ1Y=;
 b=eB7I0ztJTU4WSthYXqaqoUu5nSugYMxc2h5yrlbERDylgNa5sZlC76hDkZJW/uGdnY
 ryKSBxW9gyHVLeTlXc6NsDiakiPlYlrOyMvJ/xlp1jS23dc0hXzSpa4Cl8FGA2UIilYA
 xGMU+MW5UDmVHJoqO/4M1gy3YcmzlczR8Qs7pwBwCQYHulXFSBfKNUF6DAjG7tHwurKS
 7hWQMmdU4QDHD8vWyntNOXjcA3mFqaj6QqyYjBEkYf1TZi4lLIy+F25pU0WA1Rj6B2y7
 ueSqb9UzN5PuY4e2y/IURP+J0HzudC0TfY1mYMtZYIEsE+gjxsAiOLOeySmE5XCqXHBz
 MfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SGZKUpYTKCkpMjR2/gp6H6g/7u9i9ZZGE+6qybYiQ1Y=;
 b=U4ZuIU445L1nTPTIbsn5UpaqbcGOSNLX1toZ9kz4HCKKG+ieTj1WrP4TO3wbenwW7K
 ptIBLY/+vTIowtmu8Dq1SQXz+mycU6RwSXB0cNNRZzkdR5dZYcn7IK9WBPZ1r8+8YyBp
 5BZ1dUXVxsssE3svC4+beADjiB29eoLdIQcqazTwlkRGE5PC3spBoTawYwgtKP37sVBY
 O3uIP1nJ1kWU4L63JCx4AJnYURfn/aHdUeukR3BMKQgRYXQV+9POkAy2NdbqFRJHY/dD
 OZIeSY8c1cIQy/vbxhjAnLtyq/kLhUPbvpOqScxcVqgTp1BlTWnf0/1CT5JcO/hqGTVY
 sK8A==
X-Gm-Message-State: AOAM533/ehq87ur8D/y+YYdmwhb13rOsJuEobrcHL2dlntKThNPL0euU
 LzOo9KFJM+sBOChANwotR3k=
X-Google-Smtp-Source: ABdhPJx4V/D/s9pzIYwlx+8snhleVdhwnfP6tP4uC6/N2c5q73hqwxsDv7A3bUhT6kOfk3YclbwQTg==
X-Received: by 2002:a17:90a:c58b:: with SMTP id
 l11mr1847841pjt.195.1596610526653; 
 Tue, 04 Aug 2020 23:55:26 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id h5sm1835143pfq.146.2020.08.04.23.55.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Aug 2020 23:55:26 -0700 (PDT)
Date: Tue, 4 Aug 2020 23:55:12 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 3/3] ASoC: fsl_sai: Replace synchronous check with
 fsl_sai_dir_is_synced
Message-ID: <20200805065511.GA1131@Asurada-Nvidia>
References: <20200805063413.4610-1-shengjiu.wang@nxp.com>
 <20200805063413.4610-4-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200805063413.4610-4-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Wed, Aug 05, 2020 at 02:34:13PM +0800, Shengjiu Wang wrote:
> As new function fsl_sai_dir_is_synced is included for checking if
> stream is synced by the opposite stream, then replace the existing
> synchronous checking with this new function.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Nice, thanks!
