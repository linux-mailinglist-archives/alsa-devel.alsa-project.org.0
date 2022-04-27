Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEDE51153C
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 13:21:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A73317A9;
	Wed, 27 Apr 2022 13:21:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A73317A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651058517;
	bh=VSCBFKkAiYMZ8O0yi/SRUdv2hr/3/h3EV7C4ntz6kkc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fVv08lMcvyBLJBYLVlVA71Q6crKyXjN7x8GeaA3s9QAcvsGvMocYvstqslmrB/eYb
	 y67ll+cXVF/mCGIHRwzlJMjax9xgFB5QZ7YBFa0kn8OGQ7hDhQq7Vu6VSfqD0hduto
	 f5eCsio5N32H0y2YHN+rr7V5cOZxzfNfPEI313S4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5C6FF80253;
	Wed, 27 Apr 2022 13:20:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9131FF80100; Wed, 27 Apr 2022 13:20:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 672D7F80100
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 13:20:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 672D7F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="lu0fmt9m"
Received: by mail-pf1-x42a.google.com with SMTP id z16so1326520pfh.3
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IL14d/pmyiW693Li81GbhxCbBgtJr+WXyBOxKQ+g0CE=;
 b=lu0fmt9myGPvs88kE0cBpH5PIbZqeQAsKHEAUPSevvLw5WCznxvWfTUSA4geyw2gCn
 FPUbUQXkHJ5MsRZhsmKmfGC4CuAHA5mfCJrrsMN+j8EixPx1dw5WXLbZZZzuQsYKK9wu
 fGM5E2cw25chzjP3gO+D9iu26Wt8t9pwAz140=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IL14d/pmyiW693Li81GbhxCbBgtJr+WXyBOxKQ+g0CE=;
 b=bEVanv/mnBmNpKeKpIUzZhFN0eAv+oA1b/hNmmN1dJU7YzmFFG1ul7ZIr17dE+Nu6l
 xu+R9216ok3aVvxG9WAUKgH4OaG1vwI+ANGuJJ2s6gf1bqptWBKv+yRG89shh35JHvYw
 HU3r93kMz19H/+ittfPXzyIuwCPSNg8qQZrtgzcvxgZRgF8vKPiNoikeAYaJm/z79r3L
 8VieluwGp95nB+bjeK6IemIANOoge2Rw+EIm6fQaIFP8k8ItvuQjL9QeH32LeQTJxVB2
 m4jYktWDsmj91wi4c7EIva7F+mTtFg/DV09jVXfKUxjCoYb9f/x5Iwffwb2eSgx3G5MT
 dV5Q==
X-Gm-Message-State: AOAM531QXeD/itzy0INq06odDGihb0L+sxJexTrZ3obUrfWDOWJXiict
 aQav15Q3MVtYx9b7TbBhbu67Tw==
X-Google-Smtp-Source: ABdhPJxcVbi9eDm143jrgTF/Ua72J8J6FgRPz7WQpga4btBhGfAbgwny5A+x0AbJPwPhRkMFtUA0YQ==
X-Received: by 2002:a05:6a00:174f:b0:4fd:aed5:b5e4 with SMTP id
 j15-20020a056a00174f00b004fdaed5b5e4mr29290708pfc.39.1651058447839; 
 Wed, 27 Apr 2022 04:20:47 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8e2d:263:26e7:c039])
 by smtp.gmail.com with ESMTPSA id
 9-20020a17090a034900b001d7e6226b3csm2572101pjf.27.2022.04.27.04.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 04:20:47 -0700 (PDT)
Date: Wed, 27 Apr 2022 20:20:42 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: ipc3-topology: Correct get_control_data
 for non bytes payload
Message-ID: <YmknCrJKihRkpyTq@google.com>
References: <20220427105253.16640-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427105253.16640-1-peter.ujfalusi@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, cujomalainey@google.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com,
 senozhatsky@chromium.org, broonie@kernel.org
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

On (22/04/27 13:52), Peter Ujfalusi wrote:
> It is possible to craft a topology where sof_get_control_data() would do
> out of bounds access because it expects that it is only called when the
> payload is bytes type.
> Confusingly it also handles other types of controls, but the payload
> parsing implementation is only valid for bytes.
> 
> Fix the code to count the non bytes controls and instead of storing a
> pointer to sof_abi_hdr in sof_widget_data (which is only valid for bytes),
> store the pointer to the data itself and add a new member to save the size
> of the data.
> 
> In case of non bytes controls we store the pointer to the chanv itself,
> which is just an array of values at the end.
> 
> Reported-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Looks good to me. Thank you.
FWIW,
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Tested-by: Sergey Senozhatsky <senozhatsky@chromium.org>


So below is what I ended up with for 5.10. The original patch does not
apply cleanly because -stable is missing a number of patches, so I crafted
a backport. If it looks OK to you then we probably can send it to stable
folks.

---
 sound/soc/sof/topology.c | 42 +++++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index c1fc7bcf4eb5..2b80dbe427c1 100644
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
+			wdata[i].pdata = cdata->data;
+			wdata[i].pdata_size = cdata->data->size;
+		} else {
+			/* points to the control data union */
+			wdata[i].pdata = cdata->chanv;
+			/*
+			 * wdata[i].control->size is calculated with struct_size
+			 * and includes the size of struct sof_ipc_ctrl_data
+			 */
+			wdata[i].pdata_size = wdata[i].control->size -
+				sizeof(struct sof_ipc_ctrl_data);
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
