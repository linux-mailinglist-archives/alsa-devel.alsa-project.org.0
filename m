Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C57F511820
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 15:10:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 922E917A2;
	Wed, 27 Apr 2022 15:09:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 922E917A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651065030;
	bh=e6xGywLcX0101hcEv8u2O6zeeEux8RXeETnpT+Rpybs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k+7GEy5zrL6GPeW3VW6skKQ1IpN9/AG7ZaWfN80wrHZcoBFASYWdgJJ0BmwkZhGbh
	 wZ93NKsMtjqZd3+z6jo1XEquiW/gD1zbolM/PSvlbXruZN+3NkQKhz8VY2G3mAYMUK
	 8NFvwKRuQNdXDp63RPdAgvq9hDTRaNeTAt1b3kCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34E17F80152;
	Wed, 27 Apr 2022 15:09:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EC71F8016E; Wed, 27 Apr 2022 15:09:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D740F80152
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 15:09:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D740F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="kuUSMG7c"
Received: by mail-pj1-x1034.google.com with SMTP id fv2so1440385pjb.4
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 06:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=I5p0hV+TwBwjsgZNGvX8XN68V3XCv2JKwi8F4mHH+vs=;
 b=kuUSMG7cK8jz8F9+hZ8iXJyUVBSIXNbv58X2nmjQyUwrFHC3V0kDT5AOfo3Y2vic2w
 s7dfiGYgAZbjwouv8sWz2YKux60A7quW/RW95urruy714j67rNHAqaMv/DCFa2QDooyl
 LvTZlKKoh6WZlfoLIu88SYnebExT8DPOI2pKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I5p0hV+TwBwjsgZNGvX8XN68V3XCv2JKwi8F4mHH+vs=;
 b=TCjxaDF44dS1uV65txa/KWiV/rwxdsxXdGT7P6cLP/D1czvg99suAf5c5EXPGW54qY
 Gk/vaapy9ZkHMHOfSIBMfQO0ylU5Rn3oAh+NTWJOE2kqWtgKGdlbMhS1E3r/zhZHP1WS
 ipcu+wtTZWjkIwxM0PhR9432K/54R/ddZ3wQLX9G4hcSS5/z3Xi/WfOJdSOc8PYFHAwv
 sdLnNeMkVFzUbnF0nAutAcjue79BG+QiOR3upcHPmZb1u2AIkPBkbdhvwBmgTvCiAjBX
 VVbIQt3YIrCsebWvy607yGtWfHxDCdFnb7jqcf9JA+eKf3qY/uwarheWvUuT+S+d70eQ
 byNg==
X-Gm-Message-State: AOAM530j2oA2Ae+c1yyVRGyJ+WPP73R8c0beXYpJQQ/s1YRk+ivu92iw
 4hbOyVXsiyg8IfOeYBXeF3EFzw==
X-Google-Smtp-Source: ABdhPJxmayT7zXl7sibWPsjhw+Xq61mC739TWJL+2h+QM72HXSqUXqKFXYWf93TmjuEM6hQ6z1w0MA==
X-Received: by 2002:a17:903:22c6:b0:15d:45d8:8f8a with SMTP id
 y6-20020a17090322c600b0015d45d88f8amr5871445plg.31.1651064968824; 
 Wed, 27 Apr 2022 06:09:28 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8e2d:263:26e7:c039])
 by smtp.gmail.com with ESMTPSA id
 f33-20020a631021000000b0039dbae3fce0sm16191999pgl.43.2022.04.27.06.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 06:09:28 -0700 (PDT)
Date: Wed, 27 Apr 2022 22:09:23 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v3] ASoC: SOF: ipc3-topology: Correct get_control_data
 for non bytes payload
Message-ID: <YmlAgxxuG+zbnyP9@google.com>
References: <20220427124025.14615-1-peter.ujfalusi@linux.intel.com>
 <YmlAOm7AlZGpQLPS@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmlAOm7AlZGpQLPS@google.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, cujomalainey@google.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

On (22/04/27 22:08), Sergey Senozhatsky wrote:
> 
> I also have a 5.4 backport but it's entirely untested.

5.4

---

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index fa299e078156..a70b7e71c235 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -45,7 +45,8 @@
 struct sof_widget_data {
 	int ctrl_type;
 	int ipc_cmd;
-	struct sof_abi_hdr *pdata;
+	void *pdata;
+	size_t pdata_size;
 	struct snd_sof_control *control;
 };
 
@@ -1761,6 +1762,7 @@ static int sof_get_control_data(struct snd_sof_dev *sdev,
 				size_t *size)
 {
 	const struct snd_kcontrol_new *kc;
+	struct sof_ipc_ctrl_data *cdata;
 	struct soc_mixer_control *sm;
 	struct soc_bytes_ext *sbe;
 	struct soc_enum *se;
@@ -1797,15 +1799,25 @@ static int sof_get_control_data(struct snd_sof_dev *sdev,
 			return -EINVAL;
 		}
 
-		wdata[i].pdata = wdata[i].control->control_data->data;
-		if (!wdata[i].pdata)
-			return -EINVAL;
+		cdata = wdata[i].control->control_data;
+		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES) {
+			if (cdata->data->magic != SOF_ABI_MAGIC)
+				return -EINVAL;
 
-		/* make sure data is valid - data can be updated at runtime */
-		if (wdata[i].pdata->magic != SOF_ABI_MAGIC)
-			return -EINVAL;
+			wdata[i].pdata = cdata->data->data;
+			wdata[i].pdata_size = cdata->data->size;
+		} else {
+			/* points to the control data union */
+			wdata[i].pdata = cdata->chanv;
+			/*
+			 * wdata[i].control->size is calculated with struct_size
+			 * and includes the size of struct sof_ipc_ctrl_data
+			 */
+			wdata[i].pdata_size = wdata[i].control->size -
+					      sizeof(struct sof_ipc_ctrl_data);
+		}
 
-		*size += wdata[i].pdata->size;
+		*size += wdata[i].pdata_size;
 
 		/* get data type */
 		switch (wdata[i].control->cmd) {
@@ -1909,10 +1921,12 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 	 */
 	if (ipc_data_size) {
 		for (i = 0; i < widget->num_kcontrols; i++) {
-			memcpy(&process->data + offset,
-			       wdata[i].pdata->data,
-			       wdata[i].pdata->size);
-			offset += wdata[i].pdata->size;
+			if (!wdata[i].pdata_size)
+				continue;
+
+			memcpy(&process->data[offset], wdata[i].pdata,
+			       wdata[i].pdata_size);
+			offset += wdata[i].pdata_size;
 		}
 	}
 
