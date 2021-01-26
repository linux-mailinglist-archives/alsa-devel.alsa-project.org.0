Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0E83043F2
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 17:44:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE808179E;
	Tue, 26 Jan 2021 17:43:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE808179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611679473;
	bh=JxweStc0O/FyuFWMjH3MabLfC1vsDkWPjzoGynaYCZE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pBpKP6zQ/p+9at7AhhHsT3baNwwjqAez1ZpJhfb4Rk44ppoGibxA1TPlZaBp/xLxQ
	 4LMSZn3kxF4ujYGRR1n9g6n0urlOsZotiU8u3IGl94+tICc4TBSaYvuDkgr4DW7mUo
	 KRdtqxzFOR/hnAUmr2BE8XZrB64uIPAL6Q18ACiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73706F801D8;
	Tue, 26 Jan 2021 17:43:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0360CF8015B; Tue, 26 Jan 2021 17:43:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5E95F80108
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 17:43:33 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 58BDCA0040;
 Tue, 26 Jan 2021 17:43:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 58BDCA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1611679413; bh=NRqRVY7j0137lZrD9/UW07BGgN8RuZnR22IkTCDL7lU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bs7hkUGQmBG5W0GoA6aSWhNdKw+HBkLnm09ulN7pq4gJ0K0XYPfTaBt9XlgHo7gQg
 7KT3TEStk5y85JIwz6AHEflFNP6xE9jF86af4CbLRiMGBp64sl2qFQABXztf/uEP+e
 D2p5r8uZ/7Gha/AfaFEcfmVsnkxtFqX29qfj0DQs=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 26 Jan 2021 17:43:23 +0100 (CET)
Subject: Re: [PATCH 2/3] ASoC: Intel: tgl: remove sof_fw_filename set for
 tgl_3_in_1_default
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20210125070500.807474-1-kai.vehmanen@linux.intel.com>
 <20210125070500.807474-2-kai.vehmanen@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <3007a757-b8c7-40bb-f852-92d0e9db62aa@perex.cz>
Date: Tue, 26 Jan 2021 17:43:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210125070500.807474-2-kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Libin Yang <libin.yang@intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com,
 Bard Liao <bard.liao@intel.com>
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

Dne 25. 01. 21 v 8:04 Kai Vehmanen napsal(a):
> From: Libin Yang <libin.yang@intel.com>
> 
> tgl_3_in_1_default link topology may be used by both TGL-LP and TGL-H.
> Let's remove the sof_fw_filename setting in struct snd_soc_acpi_mach
> and use the default_fw_filename setting in struct sof_dev_desc.
> 
> Signed-off-by: Libin Yang <libin.yang@intel.com>
> Reviewed-by: Bard Liao <bard.liao@intel.com>
> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Tested-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
