Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCE251167E
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 13:55:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B45CE1798;
	Wed, 27 Apr 2022 13:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B45CE1798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651060556;
	bh=v6Zp/uBPrlPhU0bWdkzX6Cgjz6itzjR732aocQbBhyo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X7X5fl6PHX9x4Pqc0LGWzwLqypL4k6U4TEGftJUv0xumrgxtZPwf85zDO9Aj5yNXe
	 gI3UB9S1MwPWJlh8BC//0sBDjeMToHGfSsqwxY8hVZ/hc9HOseg/qvCb0gOUPFZ8O9
	 f5RwvlHhBz8RFqD2EHMBdeaaPkbGND/fGpms4JDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2188FF80253;
	Wed, 27 Apr 2022 13:54:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0011CF8016E; Wed, 27 Apr 2022 13:54:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37DF5F80100
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 13:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37DF5F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="l3Onkdn+"
Received: by mail-pj1-x102f.google.com with SMTP id p6so1292224pjm.1
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 04:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ALScz0w2ah8Ogqi82zO/lgWq7cK9n6bhLNHpRt5KWCQ=;
 b=l3Onkdn+BPmKHrwhJLlsZUWbsTmyuTKivMHGqZrC1zc2tMj4vskXM38rdFG0SeoH5t
 ydmzsbY5W+jHd/xdzgCZmo8DfIFXeVenvF5xVhkvwcmDhBElNDHZqOnp2+ENHYjnA7Ia
 HtWp0enZ4o24y+/rwHqGl8AAR/0sliU4KRpG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ALScz0w2ah8Ogqi82zO/lgWq7cK9n6bhLNHpRt5KWCQ=;
 b=6rnri5z0QHNlr7wuFC1p9xCia+dNDV7N1NVPo/90E9nhnjHYXWTQ2CM5dFsLUTrCBB
 W0+4OLdYyW4YWolE1TBrLfGY61nCFrvXOTQaPxqxn4qXCN3B9GMNT1SDA9l1H42gBAwP
 WOStQdxv4szx7WOGHoPdzEOYaf2SRExTdQKUnI18DLJLVhpw7Cm4kdV3uvMub916eX7B
 LwPDFQWQ2kxN/TZKiCZfdf7AW2POJVBQHJarqr56SkCz4zV7t/yGt4VYDP+4XnTAa6JU
 Prrs4M8dWHMcDgdAAOrpzjMra638bvZyBd+qKJp9Z40anoEVqphQN9Aqs/JhK7RdPtzH
 WTTg==
X-Gm-Message-State: AOAM533hv5QIdp75CrMoRg/9SHlNJu6EsYukTxtPJoKlx4t2v2fST3oZ
 hr1w308qdz85XM3J/6blI2xiog==
X-Google-Smtp-Source: ABdhPJymlWaLY+CWtydnfwZiuxdG7qU+Td91gG5evS+eu3CYzNkTAzzBGogh1e3pw5QoF3KO90qbcg==
X-Received: by 2002:a17:90a:cd06:b0:1cb:8c74:2baf with SMTP id
 d6-20020a17090acd0600b001cb8c742bafmr42901855pju.214.1651060489020; 
 Wed, 27 Apr 2022 04:54:49 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8e2d:263:26e7:c039])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a62de03000000b0050d4bd4141esm8006216pfg.215.2022.04.27.04.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 04:54:48 -0700 (PDT)
Date: Wed, 27 Apr 2022 20:54:44 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: ipc3-topology: Correct get_control_data
 for non bytes payload
Message-ID: <YmkvBAgBrxRAMUcO@google.com>
References: <20220427105253.16640-1-peter.ujfalusi@linux.intel.com>
 <YmknCrJKihRkpyTq@google.com>
 <83698b90-855a-f5e0-11ba-94aba393a7b1@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83698b90-855a-f5e0-11ba-94aba393a7b1@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, cujomalainey@google.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com,
 Sergey Senozhatsky <senozhatsky@chromium.org>, broonie@kernel.org
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

On (22/04/27 14:33), Péter Ujfalusi wrote:
> > @@ -2100,6 +2101,7 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
> >  				size_t *size)
> >  {
> >  	const struct snd_kcontrol_new *kc;
> > +	struct sof_ipc_ctrl_data *cdata;
> >  	struct soc_mixer_control *sm;
> >  	struct soc_bytes_ext *sbe;
> >  	struct soc_enum *se;
> > @@ -2136,16 +2138,28 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
> >  			return -EINVAL;
> >  		}
> >  
> > -		wdata[i].pdata = wdata[i].control->control_data->data;
> > -		if (!wdata[i].pdata)
> > -			return -EINVAL;
> > +		cdata = wdata[i].control->control_data;
> > +		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES) {
> > +			if ((void *)cdata->data == NULL)
> 
> Is there a need for casting it to void*?

clang appears to be unhappy otherwise.

	error: comparison of array 'cdata->data' equal to a null pointer is always false

Changing this into `if (!cdata->data)` is a little bit better as now
'always false' becomes 'always true'

	error: address of array 'cdata->data' will always evaluate to 'true'

> > +				return -EINVAL;
> >  
> > -		/* make sure data is valid - data can be updated at runtime */
> > -		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES &&
> > -		    wdata[i].pdata->magic != SOF_ABI_MAGIC)
> > -			return -EINVAL;
> > +			if (cdata->data->magic != SOF_ABI_MAGIC)
> > +				return -EINVAL;
> > +
> > +			wdata[i].pdata = cdata->data;
> 
> you want to save the cdata->data->data, so w/o the abi header stuff.

Oh... good catch!

I used `wdata[i].control->control_data->data` for tests, converted this
to cdata the very last moment.

So something like this then

---
 sound/soc/sof/topology.c | 42 +++++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index c1fc7bcf4eb5..60b4b0053e98 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -50,7 +50,8 @@
 struct sof_widget_data {
 	int ctrl_type;
 	int ipc_cmd;
-	struct sof_abi_hdr *pdata;
+	void *pdata;
+	size_t pdata_size;
 	struct snd_sof_control *control;
 };
 
@@ -2100,6 +2101,7 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
 				size_t *size)
 {
 	const struct snd_kcontrol_new *kc;
+	struct sof_ipc_ctrl_data *cdata;
 	struct soc_mixer_control *sm;
 	struct soc_bytes_ext *sbe;
 	struct soc_enum *se;
@@ -2136,16 +2138,28 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
 			return -EINVAL;
 		}
 
-		wdata[i].pdata = wdata[i].control->control_data->data;
-		if (!wdata[i].pdata)
-			return -EINVAL;
+		cdata = wdata[i].control->control_data;
+		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES) {
+			if ((void *)cdata->data == NULL)
+				return -EINVAL;
 
-		/* make sure data is valid - data can be updated at runtime */
-		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES &&
-		    wdata[i].pdata->magic != SOF_ABI_MAGIC)
-			return -EINVAL;
+			if (cdata->data->magic != SOF_ABI_MAGIC)
+				return -EINVAL;
+
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
@@ -2236,10 +2250,12 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
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
 
-- 
2.31.0
